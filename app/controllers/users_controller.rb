class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

   def show
  	@users = User.all
    @user = User.find(params[:id])
  end

  def index
    
  	@users = User.all 
  end

   #after_create :welcome_send

   private 

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
