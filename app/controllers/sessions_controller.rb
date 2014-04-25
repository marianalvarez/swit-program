class SessionsController < ApplicationController
	def new
  end

  def create
  	@user = User.find_by(username: params[:username])
  	#raise @user.to_yaml
  	if @user && @user.authenticate(params[:password])
  		session[:nickname] = @user.nickname
  		redirect_to sweet_page_path
  	else
  		redirect_to login_path
  	end
  end

  def destroy
  	session.destroy
  end
end




end
