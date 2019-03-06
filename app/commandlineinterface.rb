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
            display_menu
        elsif user_menu_input == "B"
            search_by_state
            display_menu
        elsif user_menu_input == "C"
            view_favorites
            display_menu
        elsif user_menu_input == "D"
            delete_user_account
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
       user_input = gets.chomp.slice(0,5)
    #slice chomps up the input of zipcode to the frist 5 characters
       brewery_array = Brewery.where(zip: user_input)
        
    #check to see if there's anything returning from the database 
       if brewery_array.length > 0 
        brewery_array.each do |brewery|
                puts brewery.name
                puts brewery_array.state
                puts brewery_array.street
                puts "Would you like to add to your favorite? y/n"
                user_anwer = gets.chomp
                    if user_anwer =="y"
                        create_favorites(brewery.id)
                        puts "Saved!"           
                    elsif user_anwer == "n"
                        puts "No worries." 
                    end
            end
        else
            response_hash = ApiCommunicator.get_breweries
            count = 0

            response_hash.each do |brewery|
                # binding.pry
                if user_input == brewery["postal_code"].slice(0,5)
                    # binding.pry
                    count +=1
                    puts brewery["name"]
                    puts brewery["state"]
                    puts brewery["street"]
                    puts "Would you like to add to your favorite? y/n"
                    user_anwer = gets.chomp
                    if user_anwer =="y"
                        #create a record into the breweries database
                        brewery_obj = Brewery.create(name: brewery["name"], street:brewery["street"],city:brewery["city"],state:brewery["state"],zip:brewery["postal_code"],country:brewery["country"],phone:brewery["phone"],website_url:brewery["website_url"])
                        # binding.pry

                        # create_favorites(brewery.id)
                        #get brewery.id to create favorite 
                        create_favorites(brewery_obj.id)
                        puts "Saved!"           

                    elsif user_anwer == "n"
                        puts "No worries." 
                    end            
                else
                    
                end
                
            end 
            if count == 0
                puts "Nothing Found"
            end
        end #end of a if statement to check database records
    end #end of a def method 


    #writing method for Option B
    def search_by_state
        puts "Please give me a state, master"
        user_input = gets.chomp.downcase.capitalize
        brewery_array = Brewery.where(state: user_input) 
     
        #check to see if there's anything returning from the database    
        if brewery_array.length > 0 
            brewery_array.each do |brewery|
                puts brewery.name
                puts brewery.state
                puts brewery.street
                puts brewery.phone
                puts "Would you like to add to your favorite? y/n"
                user_anwer= gets.chomp
                    if user_anwer == "y"
                        create_favorites(brewery.id)
                        puts "Saved!"
                    elsif user_anwer == "n"
                        puts "No worries."
                    end 
            end 
        else
            response_hash = ApiCommunicator.get_breweries_by_state(user_input)

            response_hash.each do |brewery|
            puts brewery["name"]
            puts brewery["state"]
            puts brewery["street"]
            puts "Would you like to add to your favorite? y/n"
                user_anwer = gets.chomp
                    if user_anwer =="y"
                        #create a record into the breweries database

                        brewery_obj = Brewery.create(name: brewery["name"], street:brewery["street"],city:brewery["city"],state:brewery["state"],zip:brewery["postal_code"],country:brewery["country"],phone:brewery["phone"],website_url:brewery["website_url"])

                        # binding.pry

                        # create_favorites(brewery.id)
                        #get brewery.id to create favorite 
                        create_favorites(brewery_obj.id)
                        puts "Saved!"           

                    elsif user_anwer == "n"
                        puts "No worries." 
                    end
            end 
          
        end 
    end 
    
    #helper method to add favorite to favorites table in database 
    def create_favorites(brewery_id)
        Favorite.create(user_id: current_user.id,brewery_id:brewery_id)
    end 
    
    #writing method for Option C
    def view_favorites
        #current_user will call favorites method to see the list of favorites table in database
        favorite_array = Favorite.where(user_id:current_user.id)
       
        favorite_array.each do |favorite|
           puts Brewery.find(favorite.brewery_id).name
           puts Brewery.find(favorite.brewery_id).street
           puts Brewery.find(favorite.brewery_id).city
           puts Brewery.find(favorite.brewery_id).state
            end 
        # current_user.favorites
    end 
    #writing method for Option D 

    def delete_user_account
        # delete their favorites before deleting user 
        
        User.all.destroy(current_user.id)
        puts "Your account have been removed! I will never tell, xoxo"
    end 
end