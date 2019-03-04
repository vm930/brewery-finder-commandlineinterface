class CreateBreweries.rb < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :website_url
     
      t.timestamps
    end 
  end
end
