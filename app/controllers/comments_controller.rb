class CommentsController < ApplicationController

  def create
    # grab comment input from params and only allow body
    comment_params = params.require(:comment).permit([:body])
    # create the body
    @comment = Comment.new(comment_params)

    # find the post in the DB using the product_id from the end of params
    @post = Post.find params[:post_id]

    @comment.post = @post

    # if it passes validation
    if @comment.save
      # redirect back to the post show page and pass the post
      redirect_to post_path(@post), notice: "Comment created!"
    else
      render '/posts/show'
    end
  end

  def destroy
    @post = Post.find params[:post_id]

    @comment = Comment.find params[:id]
    @comment.destroy

    redirect_to post_path(@post)
  end

end
