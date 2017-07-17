class UsersController < ApplicationController
  protect_from_forgery
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user].permit(:username, :password))
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new', user: @user
    end
  end
end
