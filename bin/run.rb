require_relative '../config/environment'
require_relative '../app/commandlineinterface'

# cli = CommandLineInterface
# cli.greet
# cli.gets_user_input
# cli.menu

cli = CommandLineInterface.new 
cli.greet
cli.gets_user_name
cli.display_menu

# binding.pry

puts "bye"