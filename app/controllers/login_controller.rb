class LoginController < ApplicationController

  def new_session
    @user = User.new
  end

  def create_session
    user = User.find_by(name: params[:user][:name]) 
    if user 
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end
end
