class UsersController < ApplicationController

def index
    @users = User.all
  end

  def new
    if current_user
      redirect_to articles_path
    else
      @user = User.new
    end
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to aricles_path, notice: "Thank you for signing up for Ribbit"
    else
      render 'new'
    end
  end

  def show
  @user = User.find(params[:id])
end
def logout
  session[:user_id] = nil
  redirect_to :action => 'login'
end
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end