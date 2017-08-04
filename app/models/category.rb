class Category < ApplicationRecord
  acts_as_tree :order => "name"
  has_many :advertisements

  def html_view_enum
  	[['Detailed View', 0],['Customized View',1],['Normal View',2]]
  end

  rails_admin do
    create do 
      field :html_view_enum
    end
  end
end
