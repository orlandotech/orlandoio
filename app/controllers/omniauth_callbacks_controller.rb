class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!
  def all
    auth = env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    if user.persisted?
      identity = Identity.where(:provider => auth.provider, :uid => auth.uid, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
      if user.profile.public == true
        sign_in(user)
        redirect_to profile_index_path
      else
        sign_in(user)
        redirect_to(edit_profile_path(identity.user))
      end
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