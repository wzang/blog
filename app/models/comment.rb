class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id
  belongs_to :posts
  belongs_to :user
  validates :post_id , :presence => true
  validates :body, :presence => true
end
