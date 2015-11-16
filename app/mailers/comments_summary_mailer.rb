class CommentsSummaryMailer < ApplicationMailer
  # def summary_post_owner(post, owner, new_comments)
  def summary_post_owner(owner)
    # @new_comments = new_comments
    @owner = User.find(owner)
    @comments = Comment.all.where(["updated_at >= :date", {date: Date.today}])

    @updates = []
    @comments.each do |comment|
      if comment.user_id == owner
        @updates.push(comment)
      end
    end
    mail(to: @owner.email, subject: "Summary of today's new comments!")
  end
end
