class ProfileController < ApplicationController
  def show
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
      redirect_to user_path
    else
      flash[:error] = "Error updating profile"
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :social)
  end
end
