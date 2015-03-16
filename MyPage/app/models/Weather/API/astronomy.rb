require  'json'

#The query is in a Map

module Weather
  class Astronomy
    
    attr_reader :sunrise
    attr_reader :sunset

    def initialize
    end


    def initialize(query)
      @sunrise = query[:results][:channel][:astronomy][:sunrise]
      @sunset  = query[:results][:channel][:astronomy][:sunset]

#      puts @sunrise;
    end

  end
end

