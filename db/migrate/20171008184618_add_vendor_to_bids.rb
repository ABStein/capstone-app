class AddVendorToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :vendor, :string
  end
end
