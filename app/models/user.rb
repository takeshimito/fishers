class User < ApplicationRecord
  before_save { self.email.downcase! }
  has_secure_password
  #ログイン認証のための準備をしてくれる
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }  
  validates :password, presence: true, length: { minimum: 6 }
  validates :content, length: { maximum: 255 }
  validates :twitter, length: { maximum: 50 }
  
  has_many :posts, :dependent => :destroy
  
  has_many :favorites, :dependent => :destroy
  has_many :favorite_posts, through: :favorites, source: :post, :dependent => :destroy
  #favorite_postsをfavoritesテーブルの中のpost_idとして取得
  #user.favorite_postsでユーザがお気に入りした投稿を取得
  
  def like(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  #ユーザに紐づく（user.id=user_idをもつ）favoritesテーブルの中からpost_idがpost.idと一致する投稿を探す。なければ作る

  def unlike(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def like?(post)
    self.favorite_posts.include?(post)
  end
  
  def feed_favorites
    Post.whrere(post_id: self.favorite_posts_ids)
  end
  #postモデルの中からユーザと紐付いているfavorite_postsの全てのpostを取得する
  
  mount_uploader :image, ImageUploader
end