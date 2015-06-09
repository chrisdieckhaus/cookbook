class ReviewsController < ApplicationController
	def create
	    @recipe = Recipe.find(params[:recipe_id])
	    @review = @recipe.reviews.create(review_params)
	    redirect_to recipe_path(@recipe)
	end

	def show
	end

	def destroy
    	@recipe = Recipe.find(params[:recipe_id])
    	@review = @recipe.reviews.find(params[:id])
    	@review.destroy
    	redirect_to recipe_path(@recipe)
	end

	private
	    def review_params
	    	params.require(:review).permit(:reviewer, :body, :rating)
	    end
end
