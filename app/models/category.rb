class Category < ApplicationRecord
  acts_as_tree :order => "name"
  has_many :advertisements
end
