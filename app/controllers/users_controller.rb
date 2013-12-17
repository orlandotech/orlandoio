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
  end


end
