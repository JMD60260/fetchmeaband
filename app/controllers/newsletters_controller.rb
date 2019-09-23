# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:destroy]

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      cookies[:save_lead] = true
      redirect_to root_path, notice: 'Demande prise en compte.'
    else
      redirect_to root_path, notice: 'Demande non prise en compte'
    end
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:name, :email)
  end
end
