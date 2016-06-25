class CategoriesController < ApplicationController
	def show
		@category = params[:id]

		case params[:sort]
		when 'title'
			@recipes = Recipe.where(:category => @category).order("title #{sort_direction}")
		when 'rating'
			#need to figure out how to sort this both ways
			@recipes = Recipe.where(:category => @category).sort_by{|r| r.avg_rating }.reverse
		else
			@recipes = Recipe.where(:category => @category)
		end

		
		if params[:search]
			@recipes = Recipe.where(:category => @category).search(params[:search])
		end
	end
end
