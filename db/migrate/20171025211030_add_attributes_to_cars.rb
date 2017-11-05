class AddAttributesToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :title, :string
    add_column :cars, :city_mpg, :integer
    add_column :cars, :hwy_mpg, :integer
    add_column :cars, :engine, :string
    add_column :cars, :drive_type, :string
    add_column :cars, :transmission_type, :string
  end
end
