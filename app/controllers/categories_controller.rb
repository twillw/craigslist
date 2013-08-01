class CategoriesController < ApplicationController
	before_action :check_current_city
	def index
	 	@categories = Category.all
		@subcategories = Subcategory.all
	end

end
