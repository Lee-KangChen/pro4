class Post < ActiveRecord::Base
  belongs_to :user #post 屬於user； user 對 post 一對多
  has_many :comments	# 一個 post 有很多個 comments
  has_many :connections
  has_many :categories, through: :connections 
  # post to category are n-n , connection is jointable
end
