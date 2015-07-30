class CategoriesController < ApplicationController
	def show
		@category = params[:id]
		@recipes = Recipe.where(:category => @category)
	end
end
