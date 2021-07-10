require 'net/http'
require 'json'

module ExternalServices
    class OpenWeather
        API_KEY = Rails.application.credentials.open_weather_map

        def get_weather(name, type="weather")
            uri = URI("http://api.openweathermap.org/data/2.5/#{type}?q=#{URI.encode(name)}&units=imperial&appid=#{API_KEY}")
            response = Net::HTTP.get(uri)
            JSON.parse(response)
        end
    end
end
