class Comment < ActiveRecord::Base
  validates(:body, presence: true)
  # how to add scope for comment to be unique per blog post
  belongs_to :post
  belongs_to :user

  scope :update_before_today, -> { where(["updated_at <= :date", {date: Date.today}]) }

  def self.update_before_today
    self.where(["updated_at <= :date", {date: Date.today}])
  end
end
