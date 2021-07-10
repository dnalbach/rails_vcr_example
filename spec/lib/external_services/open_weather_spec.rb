require 'rails_helper'
require 'external_services/open_weather'

RSpec.describe 'OpenWeather' do
    let(:expected_nashville_response) do
        JSON.parse('{"coord":{"lon":-86.7844,"lat":36.1659},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":81.18,"feels_like":85.3,"temp_min":75.33,"temp_max":86.77,"pressure":1009,"humidity":72},"visibility":10000,"wind":{"speed":5.01,"deg":261,"gust":10},"clouds":{"all":20},"dt":1625874717,"sys":{"type":2,"id":2001447,"country":"US","sunrise":1625827064,"sunset":1625879200},"timezone":-18000,"id":4644585,"name":"Nashville","cod":200}')
    end

    describe '.get_weather' do
        context 'passed in nashville' do
            before do
                VCR.insert_cassette('open_weather/nashville')
            end

            after do
                VCR.eject_cassette
            end

            it 'returns nashville weather data' do
                nashville_weather = ExternalServices::OpenWeather.new.get_weather('nashville')
                expect(nashville_weather).to eq(expected_nashville_response)
            end
        end
    end
end
