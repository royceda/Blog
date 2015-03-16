require  'json'

module Weather
  class Location
    
    attr_reader :city
    attr_reader :country
    attr_reader :region

    def initialize
    end

    def initialize(query)
      @city    = query[:results][:channel][:location][:city];
      @country = query[:results][:channel][:location][:country]; 
      @region  = query[:results][:channel][:location][:region];

      #      puts @sunrise;
    end
  end
end

