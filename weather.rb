require 'httparty'
require './city.rb'
require './forecast.rb'
require './key.rb'

key = Key.new.key
puts "Please enter a zip code"

zip = gets.chomp

city = City.new(zip)

forecast = Forecast.new(city)

wind_string_formatted = ""

if forecast.wind_string == "calm"
  wind_string_formatted = "There is currently no wind"
else
  wind_string_formatted = "Winds are currently blowing #{forecast.wind_string}"
end


puts "It is currently #{forecast.temp_string} and #{forecast.weather} in #{city.city}, #{city.state_abbr}. #{wind_string_formatted}."
