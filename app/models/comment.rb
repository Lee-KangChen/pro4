class Comment < ActiveRecord::Base
  #include Voteable
  belongs_to :user
  belongs_to :post
#  has_many :categories, through: :connections
# comment 不用 category
	validates :content, presence: true, length: {minimum: 5} # setting users when creating new post and comment objects
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