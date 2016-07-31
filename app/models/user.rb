class User < ActiveRecord::Base
  has_many :posts		# user 對 post 一對多
  has_many :comments	# user 對 comment 一對多
	has_many :votes
	has_secure_password validations: false 
# setting users when creating new post and comment objects
	validates :name, presence: true, uniqueness: true
	validates :password, presence: true, on: :create, length: {minimum: 5}
end