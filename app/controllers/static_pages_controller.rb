class StaticPagesController < ApplicationController
  def home
    @users = User.order(:created_at).page params[:page]
  # @users = User.order(:full_name)page params[:page]
  end

  def about
  end
end
