class SessionsController < ApplicationController
  def new

  end

  def create
    # find user by email entered on sign in
    @user = User.find_by_email(params[:email])

    # if user found and password matches
    if @user && @user.authenticate(params[:password])
      # set session user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In!"
    else
      flash[:notice] = "Invalid Credentials"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
