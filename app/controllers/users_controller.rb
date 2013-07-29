class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params) 
    redirect_to login_path
  end



  private

    def user_params
      params.require(:user).permit(:name, :handle, :image_url, :email)
    end

end
