class CitiesController < ApplicationController

	def index
    @cities = City.all
	end

	def show
		@city = City.find(params[:id])
		session[:city_id] = @city.id
		@city_posts = @city.posts
	end
end
