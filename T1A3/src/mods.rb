class mods
    attr_accessor :upgrades, : vehicle

    def initialize (upgrades, vehicle, description, price)
        @upgrades = upgrades
        @vehicle = vehicle
        @description = description
        @price = price
    end

    def display_mods (vehicle, user)
        puts "#{@name}, you have the following mods on your #{@vehicle} "
    end

    def display_mod_description
        puts
        puts "Description:"
        @description.each { |description| puts "       * #{description}"}
        puts
    end
end

class Speed_Mod < mods
    def initialize
        super ("Speed Increase", ["Lamborghini_Aventaador", "Range Rover Sport", "Eurocopter Herms", "Deluxo Jet", "Limousine"] , 
        "Increases top speed and accelaration", 800)
    end
end

class Interior_Mod < mods
    def initialize
        super ("Interior Enhancement", ["Lamborghini_Aventaador", "Range Rover Sport", "Eurocopter Herms", "Deluxo Jet", "Limousine"], "Improves on existing interior by 
        adding leather protection and plush handles", 1000)
    end
end

class  Infotainment_Mod < mods
    def initialize
        super ("Improved Infotainment", ["Lamborghini_Aventaador", "Range Rover Sport", "Eurocopter Herms", "Deluxo Jet", "Limousine"], "Adds a BOSE surround sound system in addition 
        to an OLED screen with LED lights under handles", 750 )
    end
end

class Simmons_Wheels < mods
    def initialize
        super ("Simmons Wheels", ["Lamborghini_Aventaador", "Range Rover Sport", "Limousine"], "Added external extravagance and with these rims", 350)
    end
end

class VTOL_Capabilities < mods
    def initialize
        super ("VTOL Capabilities", ["Deluxo Jet"], "Vertical Landing and Takeoff similar to an F35", 2000)
    end
end
        


