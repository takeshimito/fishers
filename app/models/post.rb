class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, :dependent => :destroy
  has_many :favorite_users, through: :favorites, source: :user, :dependent => :destroy
  #fovorite_user（お気に入りにしたユーザ）をfavoritesテーブルの中のuser_idを取得
  #post.favorite_usersでこの投稿をお気に入りしているユーザを取得
  
  #validates :content, presence: true, length: { maximum: 255 }
  #validates :title, presence: true, length: { maximum: 50 }
end
