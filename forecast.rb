require 'httparty'
require './city.rb'
require './key.rb'

class Forecast
  attr_reader :temp_string, :wind_string, :weather
  attr_accessor :temp_string, :wind_string, :weather

  def initialize(city)
    key = Key.new.key

    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{city.state_abbr}/#{city.city.gsub(' ','_')}.json")

    @weather = response['current_observation']['weather']
    @weather[0] = @weather[0].downcase()
    @temp_string = response['current_observation']['temperature_string']
    @wind_string = response['current_observation']['wind_string']
    @wind_string[0] = @wind_string[0].downcase()

  end
end
