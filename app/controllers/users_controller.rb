class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params) 
		if @user.save 
			session[:user_id] = @user.id 
			redirect_to recipe_path
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
