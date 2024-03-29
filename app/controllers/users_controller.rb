# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @users = User.all
    @user = User.find(params[:id])
 end

  def index
    @users = User.paginate(page: params[:page], per_page: 9)
  end

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
