class UsersController < ApplicationController
  before_action :set_user, only: [:show, :verify]

  def show
  end

  def verify
    @user = User.find(params[:user_id])
    @user.update_attribute(:verified, true)
    flash[:success] = "Thank you!  Your account has been activated."
  end

private

  def set_user
    @user = current_user
  end
end
