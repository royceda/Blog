module Weather
  class Units
    FAHRENHEIT = 'f'
    CELSIUS   = 'c'

   
    attr_reader :temperature
    attr_reader :distance
    attr_reader :pressure
    attr_reader :speed

    def initialize(query)
      @temperature = query[:results][:channel][:units][:temperature]
      @distance    = query[:results][:channel][:units][:distance]
      @pressure    = query[:results][:channel][:units][:pressure]
      @speed       = query[:results][:channel][:units][:speed]
    end
  end
end
