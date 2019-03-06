require_relative '../config/environment'
# require_relative '../app/commandlineinterface'
# require_relative '../app/api_communicator'
ActiveRecord::Base.logger = false

# cli = CommandLineInterface.new 
# cli.greet


# binding.pry

# puts "bye"

ApiCommunicator.get_breweries_by_state



# cli.gets_user_name
# cli.display_menu
# cli.gets_user_input
