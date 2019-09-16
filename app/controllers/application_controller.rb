class ApplicationController < ActionController::Base
	before_action :configure_devise_parameters, if: :devise_controller?
	helper_method :mailbox, :conversation


	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :age, :description, :last_name, :is_alive, :email, :phone, :instrument, :genre, :level, :youtube, :skype, :twitter, :linkedin, :facebook, :password, :password_confirmation)}
		devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :age, :description, :last_name, :is_alive, :email, :phone, :instrument, :genre, :level, :youtube, :skype, :twitter, :linkedin, :facebook, :password, :password_confirmation)}
	end

	private

	def mailbox
	  @mailbox ||= current_user.mailbox
	end
	def conversation
      @conversation ||= mailbox.conversations.find(params[:id])
    end

end
