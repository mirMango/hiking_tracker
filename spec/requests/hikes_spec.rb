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
end