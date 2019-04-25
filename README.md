# :beer: BREWERY FINDER :beer:

## Setup :beers:

First, run bundle install from the root directory to install dependencies. Next run rake db:migrate to setup the database tables.

Random data has been generated already and stored for you as JSON in the db/json directory. If you would just like to get up and running quickly, simply run rake db:seed to seed the database with the supplied data.

Alternatively, you can run rake generate:all to generate a new set of random data, and then rake db:seed to seed the database.


## Getting StartedRun ruby bin/run.rb to start the program. :beers:

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

*From the main menu, type help to list all of the available commands.*

                    --A--  Search Brewery by Zip
                    --B--  Search Brewery by States
                    --C--  See My Favorites
                    --D--  Switch to Different User
                    --E--  Update User Name
                    --F--  Delete My Account
                    --G--  Exit

*From the main menu, you can get a list of breweries and list of your favorite breweries. You can go to the Switch to Different User or Update User Name to Change user info, or go to the See My Favorites to see more breweries.*

## Models: User < Favorite > Brewery :beers:

*User*
-has_many :favorites
-has_many :breweries through :favorites

*Favorite*
-belongs_to :users
-belongs_to :breweries

*Brewery*
-has_many :favorites
-has_many :users through :favorites

## SQL Schema :beers:
  ### tale breweries
  data type   column name
  string       name
  string       street
  string       city
  string       state
  string       zip
  string       country
  string       phone
  string       website_url
  datetime     created_at     null: false
  datetime     updated_at     null: false
    
  ### table favorites
  data type   column name
  integer     user_id
  integer     brewery_id
  integer     rating
  datetime    created_at      null: false
  datetime    updated_at      null: false

  ### table users  
data type  column name 
string     user_name
integer    age
datetime   created_at   null: false
datetime   updated_at   null: false

### User Stories

*As a user, I want to be able to look at all the breweries if given a zipcode*
*As a user, I want to favorite from list of breweries*
*As a user, I want to be able to look at all the breweries if given a state*
*As a user, I want to see list of breweries*
*As a user, I want to be able to switch to a different user without getting out of the program*
*As a user, I want to Delete my account along with my favorite list*

## API :beers:
[*Breweries DB*]
(https://api.openbrewerydb.org/breweries)


## Things considering to Improve:  :beers:

-Probably list top 5 Breweries within the search instead of all of list
-Adding one more validation question to make sure if the user wants to delete their account 
-Adding a functionality of letting user rate their favorite breweries
-Adding a feature where the breweries can be pull up in a list of top 5 in the local area
