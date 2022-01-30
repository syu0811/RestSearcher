require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
  describe "/shops/:id" do
    id = "J000000001"
    it "ステータス OK が返ってくる" do
      get :show, params: { id: id }
      expect(response).to have_http_status(:ok)
    end
  end
end
