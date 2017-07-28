class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :attachable_id	
      t.string :attachable_type
      t.string :filename
      t.timestamps
    end
  end
end
