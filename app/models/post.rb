class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
end
