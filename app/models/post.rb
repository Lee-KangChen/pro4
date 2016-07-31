class Post < ActiveRecord::Base
#  include Voteable
  belongs_to :user #post 屬於user； user 對 post 一對多
  has_many :comments	# 一個 post 有很多個 comments
  has_many :connections # setting users when creating new post and comment objects
  has_many :categories, through: :connections 
  # post to category are n-n , connection is jointable
  has_many :votes, as: :voteable

  def up_votes
  	self.votes.where(vote: true).length
  end
  
  def down_votes
  	self.votes.where(vote: false).length
  end

  def total_votes
    up_votes - down_votes
  end

end
