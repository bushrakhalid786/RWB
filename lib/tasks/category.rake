namespace :category do
  desc "TODO"
  task create: :environment do
  	parent_category_name = ["Motors","Classifieds"]
  	parent_category_name.each do |name|
  		parent_category = Category.create(name: name,alias_name: name.downcase)
  	end
  end

end
