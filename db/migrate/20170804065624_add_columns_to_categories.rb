class AddColumnsToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories,:html_view,:string
  end
end
