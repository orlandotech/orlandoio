class StaticPagesController < ApplicationController
  def home
    @users = User.joins(:profile).merge(Profile.published).page params[:page]
  end

  def about
  end
end
