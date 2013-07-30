class UsersController < ApplicationController

  before_action :check_user_login, except: [:new, :create]

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

  def edit
    @current_user
  end

  def update
    @current_user 
    if @current_user.update(user_params)
      redirect_to user_path(@current_user) 
    else
      redirect_to edit_user_path(@current_user), flash: { notice: @current_user.errors.full_messages }
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    redirect_to login_path, flash: { notice: "Your account has been destroyed"}
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password)
    end

end
