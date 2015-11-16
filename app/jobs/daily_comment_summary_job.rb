class DailyCommentSummaryJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    @comments = Comment.all.where(["updated_at >= :date", {date: Date.today}])
    owners_to_notify = @comments.map {|comment| comment.post.user.id}
    @owners = User.find(owners_to_notify)

    @owners.each do |owner|
      owner = owner.id
      CommentsSummaryMailer.summary_post_owner(owner).deliver_later
    end

  end

end
