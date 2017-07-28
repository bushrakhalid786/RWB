class AddImageToImages < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :images, :avatar
  end
end
