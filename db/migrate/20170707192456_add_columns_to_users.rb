class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users,:first_name,:string
  	add_column :users,:last_name,:string
  	add_column :users,:email_confirmation,:string
  	add_column :users,:gender,:string
  	add_column :users,:dob_day,:string
  	add_column :users,:dob_month,:string
  	add_column :users,:dob_year,:string
  	add_column :users,:country_id,:integer
  	add_column :users,:education,:string
  	add_column :users,:designation,:string
  	add_column :users,:allow_third_party_emails,:boolean
  	add_column :users,:allow_dubizzle_email_updates,:boolean
  end
end