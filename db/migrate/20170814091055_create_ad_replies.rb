class CreateAdReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_replies do |t|
      t.string :email
      t.string :phone_number
      t.text :message
      t.integer :advertisement_id
      t.timestamps
    end
  end
end
