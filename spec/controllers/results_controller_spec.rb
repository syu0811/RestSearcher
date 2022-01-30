require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  describe "/results" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
