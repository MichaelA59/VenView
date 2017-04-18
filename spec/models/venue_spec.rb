require 'rails_helper'

describe Venue do
  it "is valid with valid attributes" do
    middleEast = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middleEast.save).to eq(true)

  end

  it "is valid without a url" do
    middleEast = Venue.new(
      name: "The Middle East",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middleEast.save).to eq(true)

  end

  it "is not valid without a name" do
    middleEast = Venue.new(
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139",
    )

    expect(middleEast.save).to eq(false)
  end

  it "is not valid without an address" do
    middleEast = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middleEast.save).to eq(false)

  end

  it "is not valid without a city" do
    middleEast = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      state: "MA",
      zip: "02139"
    )

    expect(middleEast.save).to eq(false)

  end

  it "is valid without a state" do
    middleEast = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      zip: "02139"
    )

    expect(middleEast.save).to eq(false)

  end

  it "is valid without a zip" do
    middleEast = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA"
    )

    expect(middleEast.save).to eq(false)

  end

end
