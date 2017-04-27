class SessionsController < ApplicationController
	def new
		@return_to = params[:return_to]
	end

	def create
		return_to = params[:session][:return_to]
		puts return_to
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			if return_to.empty?
				redirect_to recipes_path
			else 
				if return_to == "new"
					redirect_to new_recipe_path 
				else 
					redirect_to return_to
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
