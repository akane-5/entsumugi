class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile
    render partial: 'profile'
  end
end
