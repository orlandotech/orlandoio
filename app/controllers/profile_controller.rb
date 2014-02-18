class ProfileController < ApplicationController

 def index
    if params[:tags]
      @published_users = User.with_published_profile
      @tagged_profiles = Profile.tagged_with(params[:tags], wild: true, any:true)
      @users = @tagged_profiles.map {|profile| @published_users.find(profile.user_id)}
      @users = User.where(id: @users.map(&:id)).page params[:page]
    else
      @users = User.with_published_profile.page params[:page]
    end

    @users_count = @users.count
    @tag_cloud = Profile.tag_counts(:order => "name")
 end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @social_links = @profile.social_links
  end

  def edit
    @user = current_user
    @profile = @user.profile
    @social_links = SocialLink.where(profile_id: @profile.id) # array of all social links
  end

  def update
    @user ||= current_user
    @profile = @user.profile

    if @profile.update_for_profile(profile_params)
      flash[:notice] = "Profile Updated"
      redirect_to profile_path(current_user)
    else
      flash[:error] = "Error updating profile"
      render :edit
    end
  end

  def tags
    @tag = Profile.tokens(params[:q])
    respond_to do |format|
      format.json { render json: @tag }
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :avatar, :category, :tag_list, social_links_attributes: [:id, :account, :link, :_destroy])
  end
end
