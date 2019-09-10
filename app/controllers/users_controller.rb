class UsersController < ApplicationController
    after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def show
  	@users = User.all
    @user = User.find(params[:id])
  end
end
