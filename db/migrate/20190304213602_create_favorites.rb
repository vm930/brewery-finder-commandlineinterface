class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
     t.interger :user_id
     t.interger :brewery_id 
     t.interger :rating

     t.timestamps
    end 
  end
end
