class UsersController < ApplicationController
  
  def index
    @users = User.order(:created_at).page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user 
      flash[:notice] = "Profile successfuly updated"
    else
      render action: "edit", alert: "Profile was not updated"
    end
  end


  private
  def user_params
    return params.require(:user).permit(:full_name, :category, :email, :avatar, :password, :password_confirmation)
  end

end
