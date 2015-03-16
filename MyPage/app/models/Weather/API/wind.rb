require  'json'

module Weather
  class Units

    FAHRENHEIT = 'f'
    CELSIUS   = 'c'
    
    attr_reader :distance
    attr_reader :pressure
    attr_reader :speed
    attr_reader :temperature

    def initialize
    end

    def initialize(query)
      @distance    = query[:results][:channel][:wind][:distance];
      @pressure    = query[:results][:channel][:wind][:pressure]; 
      @speed       = query[:results][:channel][:wind][:speed];
      @temperature = query[:results][:channel][:wind][:temperature];

    end
  end
end

