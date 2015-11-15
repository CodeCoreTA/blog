class FavouritesController < ApplicationController
  before_action :authenticate_user

  def index
    
  end

  def create
    post = Post.find params[:post_id]
    favourite = Favourite.new

    favourite.post = post
    favourite.user = current_user

    if favourite.save
      redirect_to post_path(post), notice: "post favorited!"
    else
      redirect_to post_path(post), alert: "favorited already!"
    end

  end

  def destroy
    post = Post.find params[:post_id]
    favourite = current_user.favourites.find params[:id]

    favourite.destroy
    redirect_to post_path(post), alert: "favorite removed!"
  end

end
