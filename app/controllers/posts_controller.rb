class PostsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :edit, :destroy]

  def index
    # @posts = Post.all
    @posts = Post.search(params[:search]).order("updated_at DESC")

  end

  def new
    @post = Post.new
  end

  def create
    new_post =  params.require(:post).permit([:title, :body])

    @post = Post.new(new_post)

    if @post.save
    redirect_to post_path(@post), notice: "Post Created!"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

    # init @comment instance var so it is not nil when views/post/show.html.erb loads
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # find question to update
    @post = Post.find(params[:id])

    # grab input from form
    new_post =  params.require(:post).permit([:title, :body])

    if @post.update(new_post)
      redirect_to post_path(@post), notice: "Post updated!"
    else
      render :edit
    end
  end

  def delete
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to posts_path, alert: "Post deleted!"

  end

  def vote_up
    # note sure how to call this method or what to add
  end

  def search
    @posts = Post.search(params[:search])
    # render text: @posts.each {|post| puts post.title}
  end

end
