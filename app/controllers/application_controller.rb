class ApplicationController < ActionController::Base
	protect_from_forgery
	def is_admin?
	  if current_user.admin?
	    true
	  else
	  	redirect_to root_url
	  end
	end 
	# def authenticate_user!
 #  	if current_user.present?
	#     true
	#   else
	#   	redirect_to root_url
	#   end
	# end 
end
