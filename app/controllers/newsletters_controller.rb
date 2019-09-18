class NewslettersController < ApplicationController
  #skip_before_action :authenticate_user!
    before_action :set_newsletter, only: [:destroy]

    def create
      @newsletter = Newsletter.create(newsletter_params)
      if @newsletter.save
        flash[:success] = "Demande prise en compte."
        render root_path
      else
        flash[:alert] = "Demande non prise en compte"
        render root_path
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
