class FavouritesController < ApplicationController
  before_action :authenticate_user

  def index

  end

  def create
    post = Post.find params[:post_id]
    favourite = Favourite.new

    favourite.post = post
    favourite.user = current_user
    respond_to do |format|
      if favourite.save
        format.html {redirect_to post_path(post), notice: "post favourited!"}
        format.js {render :fav_create_success}
      else
        format.html {redirect_to post_path(post), alert: "favourited already!"}
        format.js {render :fav_create_failure}
      end
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favourite = current_user.favourites.find params[:id]

    favourite.destroy
    redirect_to post_path(post), alert: "favorite removed!"
  end

end
