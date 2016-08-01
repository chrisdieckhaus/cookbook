class RecipesController < ApplicationController
	before_action :require_user, only: [:new, :edit, :destroy]

	def index
		case params[:sort]
		when 'title'
			@recipes = Recipe.all.order("title #{sort_direction}")
		when 'category'
			@recipes = Recipe.all.order("category #{sort_direction}")
		when 'rating'
			#need to figure out how to sort this both ways
			@recipes = Recipe.all.sort_by{|r| r.avg_rating }.reverse
		else
			@recipes = Recipe.all
		end

		if params[:search]
			@recipes = Recipe.search(params[:search])
			puts "recipes: #{@recipes}"
			puts @recipes.present?
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
    	@recipe = Recipe.find(params[:id])
    	@recipe.destroy
    	redirect_to recipes_path
  	end

	private
		def recipe_params
	    	params.require(:recipe).permit(:title, :rating, :category, :ingredients, :directions)
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
		end
end
