# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    @contact = Contact.new(params[:home])
  end

  def new
    @contact = Contact.new(params[:contact])
 end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver

        @contact = Contact.new
        format.html { render 'new' }
        format.js   { flash.now[:success] = @message = 'Merci pour votre message ! Nous reviendrons vers vous rapidement.' }
      else
        format.html { render 'new' }
        format.js   { flash.now[:error] = @message = "Votre message n'a pas été envoyé." }
      end
    end
  end
end
