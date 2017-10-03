class AddUserIdToFavoriteCars < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_cars, :user_id, :integer
    add_column :favorite_cars, :car_id, :integer
  end
end
