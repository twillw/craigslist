class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params) 
    if @user.save
      redirect_to login_path, flash: { notice: "You've successfully
      created a new user. Please sign in." }
    else
      redirect_to new_user_path, flash: { notice: @user.errors.full_messages } 
    end
  end




  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password)
    end

end
