class AddColumnToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :make_id, :integer
  end
end
