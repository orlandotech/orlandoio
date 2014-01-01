class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :check_for_email

   def check_for_email
    if current_user
      if current_user.email == "" 
        redirect_to edit_user_registration_path  
        flash[:notice] = "Complete your profile by adding your email address and profile picture! "
    end
  end
  end

end


