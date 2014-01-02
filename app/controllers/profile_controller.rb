class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = current_user.profile if current_user
    @social_links = SocialLink.where(profile_id: @profile.id)
  end

  def edit
    @user ||= current_user
    @profile = @user.profile
    
    # @social = SocialLink.friendly.find(params[:id])
    @social_links = SocialLink.where(profile_id: @profile.id) # array of all social links 

  end

  def update
    @user ||= current_user
    @profile = @user.profile

    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profile Updated"
      redirect_to profile_path(current_user)
    else
      flash[:error] = "Error updating profile"
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :avatar, :category, social_links_attributes: [:id, :account, :link])
  end
end
