class RootController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @users = User.with_profiles
  end
end
