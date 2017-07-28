class AddColumnsToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :category_id, :integer
  	add_column :advertisements, :active, :boolean
  end
end
