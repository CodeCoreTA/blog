class Comment < ActiveRecord::Base
  validates(:body, presence: true)
  # how to add scope for comment to be unique per blog post
  belongs_to :post
  belongs_to :user
end
