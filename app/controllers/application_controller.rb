class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def check_current_city
    if session[:city_id]
      @current_city = City.find(session[:city_id])
    else
      redirect_to cities_path
    end
  end

  # def check_current_subcategory
  #   if session[:subcategory_id]
  #     @current_subcategory = Subcategory.find(session[:subcategory_id])
  #   end
  # end

  def check_user_login
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end
end
