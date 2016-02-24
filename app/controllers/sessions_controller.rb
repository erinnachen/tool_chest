class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      flash.now[:error] = "Incorrect login credentials"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
