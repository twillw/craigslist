class SubcategoriesController < ApplicationController
	before_action :check_current_city

	def show
		@subcategory = Subcategory.find(params[:id])
		@posts = Post.where(subcategory_id: @subcategory.id, city_id: @current_city.id).all
		if @subcategory
			session[:subcategory_id] = @subcategory.id
		end
	end

end
