class SessionsController < ApplicationController
	def new
		@return_id = params[:return_id]
	end

	def create
		return_id = params[:session][:return_id]
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			if return_id.empty?
				redirect_to recipes_path
			else 
				if return_id == "new"
					redirect_to new_recipe_path 
				else 
					redirect_to recipe_path(return_id)
				end
			end
		else
			redirect_to login_path
		end 
	end

	def destroy 
 		session[:user_id] = nil 
		redirect_to recipes_path 
	end
end
