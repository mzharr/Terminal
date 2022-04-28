require 'tty-prompt'
require_relative './classes/fleet'
require_relative './classes/mods'
require_relative './classes/hire'
require_relative './classes/user'
require_relative './classes/linkall'


# Creates linking also adds fleet classes
app = linkall.new.add_vehicle(Lamborghini_Aventador.new).add_vehicle(Range_Rover_Sport.new).add_vehicle(Eurocopter_Hermes.new).add_vehicle(Deluxo_Jet.new).add_vehicle(Limousine.new)
.add_mods(Speed_Mod.new).add_mods(Interior_Mod.new).add_mods(Infotainment_Mod.new).add_mods(Simmons_Wheels.new).add_mods(VTOL_Capabilities.new)


clear


# Enter User details
puts "    Welcome   "
puts "Enter your username: "

# Creates new user object 
user = user.new(user_name)
puts "Ready to hire #{user.name}"

# Main Application Loop - menu options
while true
    
    # Display hiring menu options using TTY-Prompt gem
    selection = TTY::Prompt.new.select("Please select from the following options:",  cycle: true, marker: '>', echo: false) do |menu|
        menu.choice('Hire a Vehicle', 1)
        menu.choice('View existing hire', 2)
        menu.choice('View fleet', 3)
        menu.choice('View mods', 4)

        case selection

        # 1. Make a new hire
        when 1

            # A hire has already been created
            if user.hire
                clear
                puts " You already have a hire! "

            # If there is no hire, creates a hire
            else
                # Display fleet and select a vehicle
                fleet = linkall.select_vehicle
                
                # Displays fleet details, including availability
                # User selects desired days for booking
                fleet.display_fleet
                fleet.display_description
                hire_days = fleet.select_days

                # checks if user has selected days
                while booking_days.length == 0
                    puts "   You must select days   "
                    hire_days = fleet.select_days
                end

                # creates the booking
                user.hire = hire.new(vehicle, hire_days)

                # Displays the booking for user including price
                clear
                puts "Hire Confirmed"
                user.hire.display_hire_info(user, linkall)
                back_main_menu
            end

        # View existing booking
        when 2
            
            if user.hire
                clear
                user.hire.display_hire_info(user, fleet)
                back_main_menu
            else
                # Error to be displayed if nothing hired
                clear
                puts "     No vehicle hired!      "
            end

        # View vehicles available for hire 
        when 3
            # selects vehicle to view
            fleet = linkall.select_vehicle
            
            # Display vehicle details
            fleet.display_fleet
            fleet.display_description
            fleet.display_availability
            back_main_menu

        # View available vehicle mods
        when 4
            # selects vehicle to view
            mods = linkall.select_mod
            
            # Display vehicle details
            mods.display_mods
            mods.display_description
            back_main_menu
            

        # Quit
        when 5
            # Gives user message if vehicle hired
            if cat.booking
                clear
                puts "Thank you #{user_name}!"
                puts "Enjoy your #{user_hire}}" 
                return
            end
        end
    end
end

