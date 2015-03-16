require  'json'


module Weather
  class Atmosphere
    
    attr_reader :humidity
    attr_reader :pressure
    attr_reader :rising
    attr_reader :visibility 

    def initialize
    end


    def initialize(query)
      @humidity   = query[:results][:channel][:atmosphere][:humidity]
      @pressure   = query[:results][:channel][:atmosphere][:pressure]
      @rising     = query[:results][:channel][:atmosphere][:rising]
      @visibility = query[:results][:channel][:atmosphere][:visibility]

    end
  end
end

