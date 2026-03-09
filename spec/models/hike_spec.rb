require "rails_helper"

RSpec.describe Hike, type: :model do
  let(:user) { User.create!(email: "test@test.com", password: "password123") }

  it "is valid with a name and distance" do
    hike = Hike.new(name: "Bear Creek", distance: 5.0, user: user)
    expect(hike).to be_valid
  end

  it "is invalid without a name" do
    hike = Hike.new(distance: 5.0, user: user)
    expect(hike).not_to be_valid
  end

  it "is invalid when distance is smaller than 0" do
    hike = Hike.new(name: "Bear Creek", distance: 0, user: user)
    expect(hike).not_to be_valid
  end
end