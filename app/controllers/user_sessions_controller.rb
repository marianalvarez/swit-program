class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  
  def create
    @user = User.find_by(username: params[:username])
    #raise @user.to_yaml
    if @user
      session[:username] = @user.username
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      redirect_to login_path
    end
  end

 

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end