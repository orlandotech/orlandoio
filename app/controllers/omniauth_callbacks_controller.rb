class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!
  def all
    auth = env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    if user.persisted?
      flash[:notice] = "Sign in - edit your profile to get listed on Orlando.io"
      identity = Identity.where(:provider => auth.provider, :uid => auth.uid, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
      sign_in_and_redirect(user, identity.user)  
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

    def failure
      #handle you logic here..
      #and delegate to super.sign
      super
   end

  alias_method :github, :all
  alias_method :facebook, :all
  # alias_method :meetup, :all
  # alias_method :linkedin, :all
  # alias_method :google, :all

end