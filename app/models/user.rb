class User < ActiveRecord::Base
  has_many :posts		# user 對 post 一對多
  has_many :comments	# user 對 comment 一對多
end