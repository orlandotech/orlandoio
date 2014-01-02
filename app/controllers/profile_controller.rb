class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = current_user.profile if current_user
  end

  def edit
    @user ||= current_user
    @profile = @user.profile
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
    params.require(:profile).permit(:bio, :social, :avatar, :category)
  end
end
