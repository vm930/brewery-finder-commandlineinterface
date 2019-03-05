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
    user_menu_input = gets.chomp.upcase
    
        if user_menu_input == "A"
           puts "A"
        elsif user_menu_input == "B"
            puts"B"
        elsif user_menu_input == "C"
            puts"C"
        elsif user_menu_input == "D"
            puts"D"
        elsif user_menu_input == "E"
            puts"E"
        else 
        puts "
                            Please select from the following list
                                                                        "
        display_menu
        end
    end 
    
    #writing method for Option A
    def search_by_zip(user_input)
       User.where() 
    end 
    #writing method for Option B
    def search_by_state
    end 
    #writing method for Option C
    def view_favorites
    end 
    #writing method for Option D   
    def delete_user_account
    end 
    #writing method for Option E

end