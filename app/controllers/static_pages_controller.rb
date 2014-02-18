class StaticPagesController < ApplicationController
  def home
    published_users = User.joins(:profile).merge(Profile.published)
    @users = published_users.limit(9).offset(rand(published_users.count))
  end

  def about
  end
end


# Thing.limit(1).offset(rand(Thing.count)).first