class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, :dependent => :destroy
  has_many :favorite_users, through: :favorites, source: :user, :dependent => :destroy
  #fovorite_user（お気に入りにしたユーザ）をfavoritesテーブルの中のuser_idを取得
  #post.favorite_usersでこの投稿をお気に入りしているユーザを取得
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :rate, presence: true
  
  mount_uploader :image, ImageUploader

  
  def self.search(content_key) 
    if content_key
      where(['content LIKE ?', "%#{content_key}%"]) 
    else
      all 
    end
  end

  def self.search_prefecture(prefecture_key)
    array = string_to_int(prefecture_key)
    if prefecture_key
      where(prefecture_id: array)
      #prefecture_idカラムの値＝引数prefecture_keyの数値であるデータを絞り込む
    else
      all 
    end
  end
  
  private
  
  def self.string_to_int(arr)
    array = []
    arr.each do |a|
      array << a.to_i
    end
    array
  end
  
  
end
