class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@subcategories = Subcategory.where(category_id: @category.id).all
	end

end
