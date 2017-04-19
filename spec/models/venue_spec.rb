require 'rails_helper'

describe Venue do
  it "is valid with valid attributes" do
    middle_east = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middle_east.save).to eq(true)

  end

  it "is valid without a url" do
    middle_east = Venue.new(
      name: "The Middle East",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middle_east.save).to eq(true)

  end

  it "is not valid without a name" do
    middle_east = Venue.new(
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middle_east.save).to eq(false)
  end

  it "is not valid without an address" do
    middle_east = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      city: "Cambridge",
      state: "MA",
      zip: "02139"
    )

    expect(middle_east.save).to eq(false)

  end

  it "is not valid without a city" do
    middle_east = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      state: "MA",
      zip: "02139"
    )

    expect(middle_east.save).to eq(false)

  end

  it "is valid without a state" do
    middle_east = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      zip: "02139"
    )

    expect(middle_east.save).to eq(false)

  end

  it "is valid without a zip" do
    middle_east = Venue.new(
      name: "The Middle East",
      url: "http://www.mideastoffers.com/",
      address: "472-480 Massachusetts Ave.",
      city: "Cambridge",
      state: "MA"
    )

    expect(middle_east.save).to eq(false)

  end

end
