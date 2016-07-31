class Vote < ActiveRecord::Base
	belongs_to :creator, foreign_key: :user_id, class_name: "User"  # 用creator 取代user
  belongs_to :voteable, polymorphic: true # 重點

  validates_uniqueness_of :creator, scope: [:voteable_type, :voteable_id]	# 資料驗證
end

# voets/1/post