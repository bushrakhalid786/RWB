class Advertisement < ApplicationRecord
  belongs_to :category
  has_one :location
  has_many :images, :as => :attachable
  has_one :main_image,-> { where "filename = 'main_image'" }, :as => :attachable, :dependent => :destroy, :class_name => 'Image'
  has_many :alternate_images,-> { where "filename = 'alternate_image'" }, :as => :attachable, :dependent => :destroy, :class_name => 'Image'

  scope :by_categories, -> (category_ids){ where(category_id: category_ids) }

  searchable do
    text :title, boost: 2
    text :make
    text :year
    integer :category_id
    time    :updated_at
  end

  def main_image=(image)
 	img = Image.new(filename: "main_image",attachable_id:self.id,attachable_type: self.class)
 	img.avatar = image
 	img.save
  end                                

  def alternate_images=(alt_images)
    alt_images.each do |alt_image|
      alt_img = self.alternate_images.new(filename: "alternate_image")
 	  alt_img.avatar = alt_image
    end
    self.save	 
  end    

end
