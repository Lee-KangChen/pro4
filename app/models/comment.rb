class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
#  has_many :categories, through: :connections
# comment 不用 category
end