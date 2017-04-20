require 'uri'

class Venue < ApplicationRecord
  STATES = [
    ["AK", "Alaska"],
    ["AL", "Alabama"],
    ["AR", "Arkansas"],
    ["AS", "American Samoa"],
    ["AZ", "Arizona"],
    ["CA", "California"],
    ["CO", "Colorado"],
    ["CT", "Connecticut"],
    ["DC", "District of Columbia"],
    ["DE", "Delaware"],
    ["FL", "Florida"],
    ["GA", "Georgia"],
    ["GU", "Guam"],
    ["HI", "Hawaii"],
    ["IA", "Iowa"],
    ["ID", "Idaho"],
    ["IL", "Illinois"],
    ["IN", "Indiana"],
    ["KS", "Kansas"],
    ["KY", "Kentucky"],
    ["LA", "Louisiana"],
    ["MA", "Massachusetts"],
    ["MD", "Maryland"],
    ["ME", "Maine"],
    ["MI", "Michigan"],
    ["MN", "Minnesota"],
    ["MO", "Missouri"],
    ["MS", "Mississippi"],
    ["MT", "Montana"],
    ["NC", "North Carolina"],
    ["ND", "North Dakota"],
    ["NE", "Nebraska"],
    ["NH", "New Hampshire"],
    ["NJ", "New Jersey"],
    ["NM", "New Mexico"],
    ["NV", "Nevada"],
    ["NY", "New York"],
    ["OH", "Ohio"],
    ["OK", "Oklahoma"],
    ["OR", "Oregon"],
    ["PA", "Pennsylvania"],
    ["PR", "Puerto Rico"],
    ["RI", "Rhode Island"],
    ["SC", "South Carolina"],
    ["SD", "South Dakota"],
    ["TN", "Tennessee"],
    ["TX", "Texas"],
    ["UT", "Utah"],
    ["VA", "Virginia"],
    ["VI", "Virgin Islands"],
    ["VT", "Vermont"],
    ["WA", "Washington"],
    ["WI", "Wisconsin"],
    ["WV", "West Virginia"],
    ["WY", "Wyoming"]
  ]

  validates :name, presence: true

  validates :url, format: { with: URI.regexp }, if: 'url.present?'

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :zip, presence: true
  validates :zip, format: {
    with: /[\d]/,
    message: "is not a number"
  }
  validates :zip, length: { is: 5 }
end
