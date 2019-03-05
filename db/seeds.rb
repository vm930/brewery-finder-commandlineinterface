User.destroy_all
Brewery.destroy_all

user1 = User.create(user_name:'vicky', age: 10)
user2 = User.create(user_name:'victoria', age: 21)
user3 = User.create(user_name:'victor', age: 45)

data =[
  {
    "id": 2,
    "name": "Avondale Brewing Co",
    "brewery_type": "micro",
    "street": "201 41st St S",
    "city": "Birmingham",
    "state": "Alabama",
    "postal_code": "35222-1932",
    "country": "United States",
    "longitude": "-86.774322",
    "latitude": "33.524521",
    "phone": "2057775456",
    "website_url": "http://www.avondalebrewing.com",
    "updated_at": "2018-08-23T23:19:57.825Z",
    "tag_list": [
    ]
  },
  {
    "id": 4,
    "name": "Band of Brothers Brewing Company",
    "brewery_type": "micro",
    "street": "1605 23rd Ave",
    "city": "Tuscaloosa",
    "state": "Alabama",
    "postal_code": "35401-4653",
    "country": "United States",
    "longitude": "-87.5621551272424",
    "latitude": "33.1984907123707",
    "phone": "2052665137",
    "website_url": "http://www.bandofbrosbrewing.com",
    "updated_at": "2018-08-23T23:19:59.462Z",
    "tag_list": [
      
    ]
  },
  {
    "id": 44,
    "name": "Trim Tab Brewing",
    "brewery_type": "micro",
    "street": "2721 5th Ave S",
    "city": "Birmingham",
    "state": "Alabama",
    "postal_code": "35233-3401",
    "country": "United States",
    "longitude": "-86.7914000624146",
    "latitude": "33.5128492349817",
    "phone": "2057030536",
    "website_url": "http://www.trimtabbrewing.com",
    "updated_at": "2018-08-23T23:20:31.423Z",
    "tag_list": [
      
    ]
  },
  {
    "id": 46,
    "name": "Yellowhammer Brewery",
    "brewery_type": "micro",
    "street": "2600 Clinton Ave W",
    "city": "Huntsville",
    "state": "Alabama",
    "postal_code": "35805-3046",
    "country": "United States",
    "longitude": "-86.5932014",
    "latitude": "34.7277523",
    "phone": "2569755950",
    "website_url": "http://www.yellowhammerbrewery.com",
    "updated_at": "2018-08-23T23:20:33.102Z",
    "tag_list": [
      
    ]
  },
  {
    "id": 55,
    "name": "Bearpaw River Brewing Co",
    "brewery_type": "micro",
    "street": "4605 E Palmer Wasilla Hwy",
    "city": "Wasilla",
    "state": "Alaska",
    "postal_code": "99654-7679",
    "country": "United States",
    "longitude": "-149.4127103",
    "latitude": "61.5752695",
    "phone": "",
    "website_url": "http://bearpawriverbrewing.com",
    "updated_at": "2018-08-23T23:20:40.743Z",
    "tag_list": [
      
    ]
  },
  {
    "id": 76,
    "name": "King Street Brewing Co",
    "brewery_type": "micro",
    "street": "9050 King Street",
    "city": "Anchorage",
    "state": "Alaska",
    "postal_code": "99515",
    "country": "United States",
    "longitude": "-149.879076042937",
    "latitude": "61.1384893547315",
    "phone": "9073365464",
    "website_url": "http://www.kingstreetbrewing.com",
    "updated_at": "2018-08-23T23:20:57.179Z",
    "tag_list": [
    ]
}
]

data.each do |brewery_hash| #create new instance of database
    # Brewery.create(brewery_hash) iterate over data hash to create attribute to link into the database breweries table 
    # Brewery.create(name: brewery_hash[:name])

    Brewery.create(name: brewery_hash[:name], street:brewery_hash[:street],city:brewery_hash[:city],state:brewery_hash[:state],zip:brewery_hash[:postal_code],country:brewery_hash[:country],phone:brewery_hash[:phone],website_url:brewery_hash[:website_url])
    
end
