class HomeController < ApplicationController
    require 'external_services/open_weather'

    def index
        @nashville_weather = ExternalServices::OpenWeather.new.get_weather('nashville')
    end
end
