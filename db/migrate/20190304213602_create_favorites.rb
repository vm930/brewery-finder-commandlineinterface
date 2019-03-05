class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
     t.integer :user_id
     t.integer :brewery_id 
     t.integer :rating

     t.timestamps
     
      # change_column :favorites, :rating, :boolean
      # rename_column :favorites, :rating, :favorite
    end 
  end
end
