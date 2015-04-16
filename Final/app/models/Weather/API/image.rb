require  'json'

module Weather
  class Image
    
    attr_reader :title
    attr_reader :width
    attr_reader :height
    attr_reader :link
    attr_reader :url

    def initialize
    end

    def initialize(query)
      @title  = query[:results][:channel][:image][:title];
      @width  = query[:results][:channel][:image][:width]; 
      @height = query[:results][:channel][:image][:height];
      @link   = query[:results][:channel][:image][:link];
      @url    = query[:results][:channel][:image][:url];

      #      puts @sunrise;
    end
  end
end

