class User < ActiveRecord::Base
    has_many :favorites
    has_many :breweries, :through => :favorites
    #dependent destory 
    #look up 
end