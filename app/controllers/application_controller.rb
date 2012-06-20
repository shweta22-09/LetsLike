class ApplicationController < ActionController::Base
  protect_from_forgery

	def islogin
		if(session[:user_id])
		   session[:return_to] = request.referer 
		else		
   redirect_to new_user_path
		end
	end	
	def current_user
		return User.find(session[:user_id]) if session[:user_id]
	end

end



