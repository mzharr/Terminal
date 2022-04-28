class hire
    attr_accessor :days

    # We have initialized the hotel with all this data
    # If in the future we were to expand to different locations, we could create sub Hotel classes, and hard-code the information in there. 
    def initialize(days, vehicle)
        @days = days
        @vehicle = vehicle 
    end

    def display_hire_info(user, linkall)
        puts user
        puts "Chosen Vehicle: #{@vehicle.type}"
        @vehicle.display_description
        puts
        puts "Hire Days:"
        @days.each { |day| puts "       * #{day}"}
        puts
        puts "#{@days.length} days @ $#{@fleet.price} each"
        puts "Total Price: $#{'%.2f' % booking_price}"
    end

    # calculates hire price
    def hire_price
        return @vehicle.price.to_f * @days.length
    end

end



