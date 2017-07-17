class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])

    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to "/users/#{current_user.id}"
    else
      @errors = ["Username and password do not match"]
      render 'new'
    end
  end

  def delete
    log_out
    redirect_to root_url
  end
end
