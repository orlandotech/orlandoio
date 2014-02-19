class StaticPagesController < ApplicationController
  def home
    published_users = User.joins(:profile).merge(Profile.published)
    @users = published_users.limit(9).order("RANDOM()")
  end

  def about
  end
end


# Thing.limit(1).offset(rand(Thing.count)).first