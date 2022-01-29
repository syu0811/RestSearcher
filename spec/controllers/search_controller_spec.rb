require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "/search" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
