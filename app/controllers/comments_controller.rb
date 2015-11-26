class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :edit, :destroy]

  def create
    # grab comment input from params and only allow body
    comment_params = params.require(:comment).permit([:body])
    # create the body
    @comment = Comment.new(comment_params)

    # find the post in the DB using the product_id from the end of params
    @post = Post.find params[:post_id]

    @comment.post = @post
    @comment.user = current_user


    respond_to do |format|
      if @comment.save
        CommentsMailer.notify_post_owner(@comment).deliver_later
        # redirect back to the post show page and pass the post
        format.html {redirect_to post_path(@post), notice: "Comment created!"}
        format.js {render :create_success}
      else
        format.html {render '/posts/show'}
        format.js {render :create_failure}
      end

    end

  end

  def destroy
    @post = Post.find params[:post_id]

    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
    # passes the post_id associated with the answer back to the posts#show page
    format.html { redirect_to post_path(@post), notice: "Comment Deleted!"}
    format.js { render } # by default renders views/comments/destroy.js.erb

    end

  end

end
