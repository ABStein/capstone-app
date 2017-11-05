class AddNameToFavoriteCars < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_cars, :name, :string
  end
end
