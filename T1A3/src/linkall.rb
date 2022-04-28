require 'tty-prompt'

class Storage
    attr_accessor :links

    def initialize
        @mods = []
        @fleet = []
        @price = price
    end

    def back_main_menu
        puts "Press any key to go back to the main menu"
        $stdin.getch
    clear
    end

    def add_vehicle(vehicle)
        @fleet << vehicle
        return self
    end

    def add_mods(mod)
        @mods << mod
        return self
    end

    # select vehicle menu
    def select_vehicle

        # Creates an array for the menu to display the vehicles
        menu = []
        @fleet.each { |vehicle| menu.push(fleet.vehicle)} 

        # this displays the menu using the TTY-Prompt gem. It returns the selected vehicle
        selection = TTY::Prompt.new.select("Choose a room type:", menu, cycle: true, marker: '>', echo: false)
            @rooms.each { |room| return room if room.type == selection }
    end
end


