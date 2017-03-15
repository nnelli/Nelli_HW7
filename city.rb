require 'httparty'
require './key.rb'


class City
  attr_reader :state_abbr, :city
  attr_accessor :state_abbr, :city

  def initialize(zip)
    key = Key.new.key
    geo_info = HTTParty.get("http://api.wunderground.com/api/#{key}/geolookup/q/#{zip}.json")

    @state_abbr = geo_info['location']['state']
    @city = geo_info['location']['city']
  end
end
