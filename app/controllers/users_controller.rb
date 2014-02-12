class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_user, only: [:edit, :update]

  def index
    @users = User.order(:created_at).page params[:page]
  end

  def show
    #@user = User.find(params[:id])
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

  def destroy
    self.current_user = nil 
    redirect_to root_url, notice: "signed out"
  end

  private
  def user_params
    return params.require(:user).permit(:full_name, :category, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def validate_authorization_for_user
     redirect_to root_path unless @user == current_user
  end

end
