class UsersController < ApplicationController
	def new
		@user = User.new
		@return_id = params[:return_id]
	end

	def create 
		@user = User.new(user_params) 
		return_id = params[:user][:return_id]
		if @user.save 
			session[:user_id] = @user.id 
			if return_id.empty?
				redirect_to recipes_path
			else
				redirect_to recipe_path(return_id)
			end
		else 
			redirect_to signup_path
		end 
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@reviews = Review.where("user_id = ?", @user.id).order(rating: :desc)
		@recipes = Recipe.where("user_id = ?", @user.id).order(rating: :desc)
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
