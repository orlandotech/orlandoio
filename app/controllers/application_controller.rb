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
def after_sign_in_path_for(resource)
  if @user.profile.public == true
    flash[:notice] = "Successfully signed in"
    profile_path(@user)
  else
    flash[:danger] = "Complete your profile to get listed on Orlando.io"
    edit_profile_path(@user)
  end
end

end


