require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(email: "test@test.com", password: "password123") }
  let(:hike) { Hike.create!(name: "Bear Creek", distance: 5.0, user: user) }

  it "is invalid without a body" do
    comment = Comment.new(user: user, hike: hike)
    expect(comment).not_to be_valid
  end
end