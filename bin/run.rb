require_relative '../config/environment'
require_relative '../app/commandlineinterface'

cli = CommandLineInterface.new 
cli.greet
# cli.gets_user_name
# cli.display_menu
# cli.gets_user_input


# binding.pry

puts "bye"