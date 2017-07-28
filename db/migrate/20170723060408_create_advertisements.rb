class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :price
      t.string :make	
      t.string :description
      t.string :condition
      t.string :phone_number
      t.string :warrenty
      t.string :locate_your_item
      t.string :gps_coordinate
      t.string :kilometers
      t.string :year
      t.string :body_type
      t.string :color
      t.string :transition_type
      t.string :regional_specs
      t.string :no_of_cylinders
      t.string :doors
      t.string :horse_power
      t.string :fuel_type
      t.text :extras
      t.text :technical_features
      t.timestamps
    end
  end
end