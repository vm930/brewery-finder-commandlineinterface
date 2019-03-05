class CommandLineInterface
    attr_accessor :current_user
   
    def greet
        puts "Welcome to the Brewery finder, ready to get some beers?"
        puts "I can help you find list of local breweries!"
        gets_user_name
        display_menu
    end 

        def gets_user_name
        puts "How should I call you master?"
        user_name = gets.chomp
        self.current_user = User.find_or_create_by(user_name: user_name)
        #user should be able to store their names into the users table store 
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
    user_menu_input = gets.chomp.upcase
    #will store answers in user_menu_input
    #convert all of the answers into uppercase             
        if user_menu_input == "A"
            search_by_zip
        elsif user_menu_input == "B"
            search_by_state
        elsif user_menu_input == "C"
            #view_favorites
        elsif user_menu_input == "D"
            puts"D"
        elsif user_menu_input == "E"
            exit
        else 
        puts "
                            Please select from the following list
                                                                            "
        display_menu
        end
    end 
    
    #writing method for Option A
    def search_by_zip
       puts "Please give me zip code, master"
       user_input = gets.chomp 
       zip_array = Brewery.where(zip: user_input)
       zip_array.each do |zip|
       puts zip.name
       puts zip.state
       puts zip.street
       end

    end 
    #writing method for Option B
    def search_by_state
        puts "Please give me a state, master"
        user_input = gets.chomp.capitalize
        state_array = Brewery.where(state: user_input)
        state_array.each do |state|
            puts state.name
            puts state.state
            puts state.street
        end 
    end 
    
    def create_favorites(brewery_id)
        user_id = current_user.id
        Favorites.create(user_id: user_id,brewery_id:brewery_id)
    end 
    
    #writing method for Option C
    def view_favorites
    #create a favorites 
    #   puts self.current_user
        # current_user.favorites
    end 
    #writing method for Option D   
    def delete_user_account(current_user)
        delete_user_id = User.find_by(user_name: current_user).id
        User.destroy(delete_user_id)
    end 
    #writing method for Option E

end