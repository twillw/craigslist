class LoginController < ApplicationController

  def new_session
    @user = User.new
  end

  def create_session
    user = User.find_by(name: params[:user][:name]) 
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to cities_path
    elsif !user || !password
      redirect_to login_path notice: "You've entered invalid
      credentials. Please try again."
    else
      redirect_to new_user_path
    end
  end
end
