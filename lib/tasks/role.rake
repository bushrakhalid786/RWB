namespace :role do
  desc "TODO"
  task create: :environment do
  	role = ["Normal User"]
  	role.each do |name|
  		Role.create(name: name)
  	end
  end

end
