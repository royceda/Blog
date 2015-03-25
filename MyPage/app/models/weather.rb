# -*- coding: iso-8859-1 -*-
load 'Weather/API/units.rb'
load 'Weather/API/location.rb'
load 'Weather/API/condition.rb'
load 'Weather/API/astronomy.rb'
load 'Weather/API/atmosphere.rb'
load 'Weather/API/forecast.rb'
load 'Weather/API/wind.rb'

load 'map.rb'

class Weather < ActiveRecord::Base
  ROOT = "http://query.yahooapis.com/v1/public/yql"


  def meteo id
    query = lookup(id, Units::CELSIUS)
    a  = Atmosphere.new query;
    l  = Location.new   query;
    as = Astronomy.new  query
    c  = Condition.new  query

    response = "Pour la ville de #{l.city} ( #{l.country}, #{l.region})\n Atmosphere:\n humidity: #{a.humidity} % \n pressure: #{a.pressure} \n rising: #{a.rising} \n visibility: #{a.visibility} km \n Astronomy:\n Sunrise: #{as.sunrise} \n Sunset: #{as.sunset}\n Condition:\n code: #{c.code} \n date: #{c.date} \n temp: #{c.temp} °C \n text: #{c.text}\n"

    for i in 0..4
      f = Weather::Forecast.new query, i;
      puts "Forecast:\n code: #{f.code} \n date: #{f.date} \n day: #{f.day} \n high: #{f.high} \n low: #{f.low} \n text: #{f.text} \n "
    end
    response
  end

  def Forecast query, i
    f = Weather::Forecast.new query, i;
    f
  end
  
  def Astronomy query
    as = Astronomy.new  query
    as
  end

  def Location query
    lo = Location.new query
    lo
  end

  def Condition query
    cond = Condition.new query
    cond
  end



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
    # response = "ok"
    #      if response.nil? or response.title.match(/error/i)
    #       raise "Failed to get weather [url=#{url}]."
    #   end
    response
  end
end
