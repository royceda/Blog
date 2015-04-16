# -*- coding: iso-8859-1 -*-
load 'Weather/API/units.rb'
load 'Weather/API/location.rb'
load 'Weather/API/condition.rb'
load 'Weather/API/astronomy.rb'
load 'Weather/API/atmosphere.rb'
load 'Weather/API/forecast.rb'
load 'Weather/API/wind.rb'

require 'net/http'

load 'map.rb'
require 'map'

class Weather < ActiveRecord::Base
  belongs_to :user
 
  ROOT = "http://query.yahooapis.com/v1/public/yql"

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

   # url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D580778%20and%20u%3D%27c%27&format=json"
    doc = get_response url
    puts url 
    puts "woeid #{woeid} "
    doc
  end

  def test city, country
    if lookup1 city, country
      true
    else
      false
    end    
  end


  def lookup1(city, country)
    begin 
      url = ROOT+"?q=select%20*%20from%20geo.places%20where%20text%3D'#{city}%20#{country}'&format=json"
      #puts url
      doc = get_response url
      puts doc
      puts "\n"
      
      # if puts[:count].to_i == 1
      #   puts doc[:results][:place][:woeid]
      #else 
      puts doc[:results][:place]
      
      #end
      woeid = doc[:results][:place][:woeid].to_s
      query = lookup(woeid)
      query
    rescue => e
      raise "Failed to get weather with [url=#{url}, e=#{e}]."
      false
    end
  end
    
  private
  def get_response url
    begin
      response = Net::HTTP.get_response(URI.parse url).body.to_s
      puts response
      response = Map.new(JSON.parse(response))[:query]#[:results][:channel]
    rescue => e
      raise "Failed to get weather [url=#{url}, e=#{e}]."
    end
    response
    # response = "ok"
    #     if response.nil? or response.title.match(/error/i)
    #       raise "Failed to get weather [url=#{url}]."
    #   end

    
  end
end



