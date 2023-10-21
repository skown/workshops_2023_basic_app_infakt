class WeatherPresenter
    attr_reader :data

    def initialize(data)
      @data = data
    end
  
    def encourage_text
      if good_to_read_outside?
        "Get some snacks and go read a book in a park!"
      else
        "It's always a good weather to read a book!"
      end
    end

    def description
        @description = data['current']['condition']['text']
    end

    def temperature
        @temperature = data['current']['temp_c']
    end

    def icon
        @icon = data['current']['condition']['icon']
    end

    def location
        @location = data['location']['name']
    end

    private

    def nice_weather?
        description == 'Sunny' || description == 'Partly cloudy'
    end
    
    def good_to_read_outside?
        nice_weather? && temperature > 15
    end
    
end