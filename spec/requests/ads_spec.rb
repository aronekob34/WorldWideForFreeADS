require 'rails_helper'

RSpec.describe "Ads", type: :request do
  describe "GET /ads" do
    it "works! (now write some real specs)" do
      get ads_path
      expect(response).to have_http_status(200)
    end
  end
end
