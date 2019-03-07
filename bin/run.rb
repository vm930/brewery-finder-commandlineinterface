require_relative '../config/environment'
# require_relative '../app/commandlineinterface'
# require_relative '../app/api_communicator'
ActiveRecord::Base.logger = false

puts <<-'BEER FINDER'
 
                              .sssssssss.
                        .sssssssssssssssssss
                      sssssssssssssssssssssssss
                     ssssssssssssssssssssssssssss
                      @@sssssssssssssssssssssss@ss
                      |s@@@@sssssssssssssss@@@@s|s
               _______|sssss@@@@@sssss@@@@@sssss|s
             /         sssssssss@sssss@sssssssss|s
            /  .------+.ssssssss@sssss@ssssssss.|
           /  /       |...sssssss@sss@sssssss...|
          |  |        |.......sss@sss@ssss......|
          |  |        |..........s@ss@sss.......|
          |  |        |...........@ss@..........|
           \  \       |............ss@..........|
            \  '------+...........ss@...........|
             \________ .........................|
                      |.........................|
                     /...........................\
                    |.............................|
                       |.......................|
                           |...............|

               __         __  __ ___      __   __  __  __
              |_  | |\ | |_  (_   |      |__) |_  |_  |__)
              |   | | \| |__ __)  |      |__) |__ |__ | \

BEER FINDER


cli = CommandLineInterface.new 
cli.greet


# binding.pry

puts "bye"

# ApiCommunicator.get_breweries_by_state



# cli.gets_user_name
# cli.display_menu
# cli.gets_user_input
