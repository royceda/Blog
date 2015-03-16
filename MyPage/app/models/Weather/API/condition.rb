require  'json'

module Weather
  class Condition
    
    attr_reader :code
    attr_reader :date
    attr_reader :temp
    attr_reader :text

    def initialize
    end

    def initialize(query)
      @code = query[:results][:channel][:item][:condition][:code];
      @date = query[:results][:channel][:item][:condition][:date]; 
      @temp = query[:results][:channel][:item][:condition][:temp];
      @text = query[:results][:channel][:item][:condition][:text];

      #      puts @sunrise;
    end

  end
end

