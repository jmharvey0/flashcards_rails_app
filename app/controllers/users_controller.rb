class UsersController < ApplicationController
  protect_from_forgery
  def new
    @user = User.new
  end
  def create
    # username.downcase?
    @user = User.new(params[:user].permit(:username, :password))
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new', user: @user
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
