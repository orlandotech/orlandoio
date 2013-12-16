class StaticPagesController < ApplicationController
  def home
    @users = User.page params[:page]
  # @users = User.order(:full_name)page params[:page]
  end

  def about
  end
end
