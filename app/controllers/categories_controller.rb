class CategoriesController < ApplicationController
	def show
		@category = params[:id]
		@recipes = Recipe.where(:category => @category)
		if params[:search]
			@recipes = Recipe.where(:category => @category).search(params[:search])
		end
	end
end
