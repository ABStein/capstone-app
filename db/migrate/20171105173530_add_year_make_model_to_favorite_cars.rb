class AddYearMakeModelToFavoriteCars < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_cars, :year, :integer
    add_column :favorite_cars, :make, :string
    add_column :favorite_cars, :model, :string
  end
end
