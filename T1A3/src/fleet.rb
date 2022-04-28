require 'tty-prompt'

class Fleet
    attr_reader :vehicle, :availability, :price, :descriptions

    def initialize(vehicle, descriptions, price, availability)             
        @vehicles = vehicles
        @availability = availability
        @price = '%.2f' % price
        @descriptions = descriptions          
    end

    def display_fleet
        puts "fleet Type: #{@vehicles}"
        puts "Price: $#{@price} per hire"
    end

    def display_description
        puts
        puts "Description:"
        @descriptions.each { |description| puts "       * #{description}"}
        puts
    end

    # displays the fleet availability
    def display_availability
        puts
        puts "Availability:"
        @availability.each { |day, status| puts "       * #{day}: #{status}"}
    end

    def select_days
        days_menu = []
        days_selected = []
        select_days_menu(days_menu)
        select_days_selection(days_selected, days_menu)
        return days_selected
    end

    def select_days_menu(days_menu)
        @availability.each do |day, status|
            if status != "Available"                                           
                days_menu.push({name: day.to_s, disabled: "Unavailable"})    
            else                                                                
                days_menu.push(name: day.to_s)    
            end
        end
    end

    def select_days_selection(days_selected, days_menu)
        TTY::Prompt.new.multi_select("Please select your days to hire:", days_menu, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @availability[day.to_sym] = "Booked Out"       # Converts string back to symbol, and availability is changed
            days_selected.push(day)
        end
    end
end

class Lamborghini_Aventador < fleet
    def initialize
        super("Aventador", ["All wheel drive", "12 Cylinder Engine", "4 Driving modes", "Perfect for a night out with a plus one"], 1700, 
        {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Unavailable", Sunday: "Unavailable"})
    end
end

class Range_Rover_Sport < fleet
    def initialize
        super("Range", ["Luxury SUV", "Turbocharged 6 cylinder Engine", "All Terrain", "Auto Sunblind", "Ocean views", "Perfect for a fancy group event"], 1050, 
        {Monday: "Anavailable", Tuesday: "Unavailable", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Unavailable", Sunday: "Unavailable"})
    end
end

class Eurocopter_Hermes < fleet
    def initialize
        super("Hermes", ["Perfect for comfort flying", "Minibar", "Vibranium Coated Soundproofing", "4 Passenger Seating with lumbar support"], 2000, 
        {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end

class Deluxo_Jet < fleet
    def initialize
        super("Deluxo", ["Perfect for luxury travel spanning long hours", "Deluxe washroom", "Foldable Queen Size Bunk Bed", "6 Passenger seating"], 5000, 
        {Monday: "Available", Tuesday: "Available", Wednesday: "Unavailable", Thursday: "Booked Out", Friday: "Unavailable", Saturday: "Available", Sunday: "Available"})
    end
end

class Limousine < fleet
    def initialize
        super("Limousine", ["Perfect for large events", "15 Passenger Seating", "Minibar", "LED lighting"], 800, 
        {Monday: "Unavailable", Tuesday: "Unavailable", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Unavailable", Sunday: "Unavailable"})
    end
end


