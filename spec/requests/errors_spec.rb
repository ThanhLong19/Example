require 'rails_helper'

RSpec.describe "Errors", type: :request do
  describe "GET /file_not_found" do
    it "returns http success" do
      get "/errors/file_not_found"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /internal_server_error" do
    it "returns http success" do
      get "/errors/internal_server_error"
      expect(response).to have_http_status(:success)
    end
  end

end
