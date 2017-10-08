class AddCarIdToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :car_id, :integer
  end
end
