class AddColumnsToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :location_id, :integer
  end
end
