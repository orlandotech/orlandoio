class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end

# redirect normal signup to complete profile

def authenticate_admin_user! #use predefined method name
  redirect_to '/' and return if user_signed_in? && !current_user.admin?
  authenticate_user!
end

def current_admin_user #use predefined method name
  return nil if user_signed_in? && !current_user.admin?
  profile_path(current_user)
end

def after_sign_in_path_for(resource)
 if current_user.profile.public == true
    flash[:notice] = "Successfully signed in"
    profile_index_path
  else
    edit_profile_path(current_user)
  end
end




end


