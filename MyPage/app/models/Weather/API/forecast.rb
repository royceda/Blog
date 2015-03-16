require  'json'

module Weather
  class Forecast
    
    attr_reader :code
    attr_reader :date
    attr_reader :day
    attr_reader :high
    attr_reader :low
    attr_reader :text

    def initialize
    end

    def initialize(query, i)
      
      @code = query[:results][:channel][:item][:forecast][i][:code];
      @date = query[:results][:channel][:item][:forecast][i][:date]; 
      @day  = query[:results][:channel][:item][:forecast][i][:day];
      @high = query[:results][:channel][:item][:forecast][i][:high];
      @low  = query[:results][:channel][:item][:forecast][i][:low];
      @text = query[:results][:channel][:item][:forecast][i][:text];

      #      puts @sunrise;
    end

  end
end

