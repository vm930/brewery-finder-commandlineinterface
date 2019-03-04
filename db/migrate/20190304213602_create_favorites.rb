class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
     t.integer :user_id
     t.integer :brewery_id 
     t.integer :rating

     t.timestamps
    end 
  end
end
