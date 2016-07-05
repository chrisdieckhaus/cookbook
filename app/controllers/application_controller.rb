class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

  	helper_method :sort_direction
  	helper_method :current_user
  
	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def require_user 
		redirect_to '/login' unless current_user 
	end

	private
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
		end
end
