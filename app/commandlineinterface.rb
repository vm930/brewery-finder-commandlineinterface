class CommandLineInterface
    
    def greet
    puts "Welcome to the Brewery finder, ready to get some Beers?"
    puts "I can help you find list of local breweries!"
    end 

    def gets_user_name
    puts "How should I call you master?"
    user_name = gets.chomp
    #user should get send to the users table store 
    end

    def display_menu
    puts "
                               What would you like to do,master?
                            --A--  Search Brewery by Zip
                            --B--  Search Brewery by States
                            --C--  See My Favorites
                            --D--  Delete My Account
                            --E--  Exit
    "
    #will store answers here
    #convert all of the answers into uppercase
    user_menu_input = gets.chomp.uppercase
    end 
    
    #writing method for Option A
    #writing method for Option B
    #writing method for Option C
    #writing method for Option D   
    #writing method for Option E

end