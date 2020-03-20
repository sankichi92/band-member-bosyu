class UsersController < ApplicationController
  before_action :require_current_user

  def index
    @users = User.all
  end
end
