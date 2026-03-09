require "rails_helper"

RSpec.describe "Hikes", type: :request do
  let(:user) { User.create!(email: "test@test.com", password: "password123") }

  describe "GET /hikes" do
    it "redirects to login if not authenticated" do
      get hikes_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns success if authenticated" do
      sign_in user
      get hikes_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /hikes" do
    it "creates a hike" do
      sign_in user
      post hikes_path, params: { hike: { name: "Bear Creek", distance: 5.0, description: "A great hike" } }
      expect(response).to redirect_to(hike_path(Hike.last))
    end
  end
end