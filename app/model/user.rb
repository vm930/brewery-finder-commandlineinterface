class User < ActiveRecord::Base
    has_many :favorite
    has_many :brewery, :through => :favorite
end