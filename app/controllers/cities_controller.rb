class CitiesController < ApplicationController

	def index
    	# reset_session
    	@cities = City.all
	end

	def setup_session_for_city
		@city = City.find(params[:id])
		session[:city_id] = @city.id
		# @city_posts = @city.posts
		redirect_to categories_path
	end
end
