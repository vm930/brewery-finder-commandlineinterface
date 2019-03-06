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

    def get_breweries_by_state(state)

        response_string = RestClinet.get
        ('https://api.openbrewerydb.org/breweries?by_state=New+york') #getting breweries from web
        response_hash = JSON.parse(response_string)
        
        response_hash.each do |state_array|
            state_array[:state]
        end 

    end 
end 
# Filter breweries by state:
# https://api.openbrewerydb.org/breweries?by_state=New+york
# Filter by name and state: 
#https://api.openbrewerydb.org/breweries?by_name=cooper&by_state=New+york

# Entire breweries 
# https://api.openbrewerydb.org/breweries