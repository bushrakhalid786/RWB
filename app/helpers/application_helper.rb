module ApplicationHelper

  def populate_data(advertisement)
	data_array = []
	data = advertisement.attributes.delete_if{|k,v| ["id","title","price","description","phone_number","gps_coordinate","created_at","updated_at"].include?(k)}
  	not_null_data = data.delete_if{|k,v| v.blank?}
    not_null_data.each do |key,value|
  	  if key == "category_id"
  	  	category_name = Category.where(id: value).last.name
  	  	data_array << {"Category": category_name}
  	  elsif key == "location_id"
  	  	location_name = Location.where(id: value).last.name
  	  	data_array << {"Location": location_name}
  	  else	
  	  	data_array << {"#{key.camelize}": value}
  	  end	
  	end
  	return data_array
  end

end
