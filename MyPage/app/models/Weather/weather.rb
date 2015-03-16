require 'json'
require 'net/http'
require 'map'

load '../src/API/units.rb'

module Weather
  class << self

    ROOT = "http://query.yahooapis.com/v1/public/yql"

    def lookup(woeid, unit = Units::CELSIUS)

      acceptable_units = [Units::CELSIUS, Units::FAHRENHEIT]
      unit = Units::CELSIUS unless acceptable_units.include?(unit)
      
      url = ROOT + "?q=select%20*%20from%20weather.forecast%20"
      url += "where%20woeid%3D#{woeid}%20and%20u%3D'#{unit}'&format=json"

      doc = get_response url
      #Response.new woeid, url, doc
    end

    private
    def get_response url
      begin
        response = Net::HTTP.get_response(URI.parse url).body.to_s
      rescue => e
        raise "Failed to get weather [url=#{url}, e=#{e}]."
      end

      response = Map.new(JSON.parse(response))[:query]#[:results][:channel]
      
#      if response.nil? or response.title.match(/error/i)
 #       raise "Failed to get weather [url=#{url}]."
  #   end
      
      response
    end
    
  end
end
