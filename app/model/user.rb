class User < ActiveRecord::Base
    has_many :favorites
    has_many :breweries, :through => :favorites
end