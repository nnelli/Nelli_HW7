require 'minitest/pride'
require 'minitest/autorun'
require './city.rb'

class CurrencyConverterTest < Minitest::Test
  def test_zip_call
    city = City.new(27518)
    assert_equal city.state_abbr, "NC"
    assert_equal city.city, "Cary"
  end
end
