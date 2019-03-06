require 'rest-client'
require 'json'
require 'pry'

class ApiCommunicator

    # def get_brewery_from_brewerydb
    # #make the web request
    # response_string = RestClient.get
    # ('https://api.openbrewerydb.org/breweries')
    # response_hash = JSON.parse(response_string)
    # # iterate over the response hash to find the collection of `films` for the given

    # end 

    def self.get_breweries_by_state(user_input)
        response_string = RestClient.get("https://api.openbrewerydb.org/breweries?by_state=#{user_input}") #getting breweries at state from web
        response_hash = JSON.parse(response_string)
        #after getting the entire brewery list 
        response_hash.each do |brewery|
            puts brewery["name"]
            puts brewery["state"]
            puts brewery["street"]
            puts "Would you like to add to your favorite? y/n"
                user_anwer = gets.chomp
                    if user_anwer =="y"
                        #create a record into the breweries database

                        Brewery.create(name: brewery["name"], street:brewery["street"],city:brewery["city"],state:brewery["state"],zip:brewery["postal_code"],country:brewery["country"],phone:brewery["phone"],website_url:brewery["website_url"])

                        # create_favorites(brewery.id)
                        #get brewery.id to create favorite 
                        brewery_id = Brewery.find(current_user.id).brewery_id
                        current_user.create_favorites(brewery_id)
                        
                        puts "Saved!"           
                    elsif user_anwer == "n"
                        puts "No worries." 
                    end
    end 

    def self.get_breweries
        response_string = RestClient.get('https://api.openbrewerydb.org/breweries') #getting all breweries from web
        response_hash = JSON.parse(response_string)
        response_hash
    end 

    # response_hash.each do |state_array|
    #         state_array["state"] # Brewery class
            
    #     end 
end 
# Filter breweries by state:
# https://api.openbrewerydb.org/breweries?by_state=New+york
# Filter by name and state: 
#https://api.openbrewerydb.org/breweries?by_name=cooper&by_state=New+york

# Entire breweries 
# https://api.openbrewerydb.org/breweries