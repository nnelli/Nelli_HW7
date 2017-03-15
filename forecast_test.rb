require 'minitest/pride'
require 'minitest/autorun'
require './city.rb'
require './forecast.rb'
require './key.rb'


class CurrencyConverterTest < Minitest::Test
  def test_wind_call
    city = City.new(27518)
    forecast = Forecast.new(city)
    key = Key.new.key
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/NC/Cary.json")
    wind = response['current_observation']['wind_string']
    wind[0] = wind[0].downcase()
    assert_equal forecast.wind_string, wind
  end

  def test_temp_call
    key = Key.new.key
    city = City.new(27518)
    forecast = Forecast.new(city)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/NC/Cary.json")
    temp = response['current_observation']['temperature_string']
    assert_equal forecast.temp_string, temp
  end

  def test_weather_call
    key = Key.new.key
    city = City.new(27518)
    forecast = Forecast.new(city)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/NC/Cary.json")
    temp = response['current_observation']['weather']
    temp[0] = temp[0].downcase()
    assert_equal forecast.weather, temp
  end

end
