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

  it "returns hikes that match the search term" do
    hike = Hike.create!(name: "Bear Creek", distance: 5.0, user: user)
    results = Hike.search("Bear")
    expect(results).to include(hike)
  end

  it "returns nothing when search term doesn't match" do
    hike = Hike.create!(name: "Bear Creek", distance: 5.0, user: user)
    results = Hike.search("xyz")
    expect(results).to be_empty
  end

  it "returns all hikes when search is empty" do
    hike = Hike.create!(name: "Bear Creek", distance: 5.0, user: user)
    results = Hike.search("")
    expect(results).to include(hike)
  end
end