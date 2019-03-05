class CommandLineInterface
    attr_accessor :current_user
   
    def greet
    puts "Welcome to the Brewery finder, ready to get some Beers?"
    puts "I can help you find list of local breweries!"
    gets_user_name
    display_menu
    end 

    def gets_user_name
    puts "How should I call you master?"
    user_name = gets.chomp
    self.current_user = User.find_or_create_by(user_name: user_name)
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
           #search_by_zip
        elsif user_menu_input == "B"
            puts"B"
        elsif user_menu_input == "C"
            view_favorites
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
    def search_by_zip
        # TO Look up. Difference between ActiveRcord find_by and where
        # find_by returns the first one that it finds
        # where returns a collection of all that match
       Brewery.find_by(zip: "99515")
    end 
    #writing method for Option B
    def search_by_state
        Brewery.find_by(state: "Alabama")
    end 
    #writing method for Option C
    def view_favorites
      puts self.current_user
    end 
    #writing method for Option D   
    def delete_user_account
        delete_user_id = User.find_by(user_name: "victoria").id
        User.destroy(delete_user_id)
    end 
    #writing method for Option E

end