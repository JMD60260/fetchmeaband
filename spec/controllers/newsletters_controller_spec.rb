# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
end
