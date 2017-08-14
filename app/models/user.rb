class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, 
  		 :trackable, :validatable,:confirmable

  belongs_to :role
  has_many :advertisements
  has_many :bookmarks
  
  def admin?
    role and role.name == "Admin"
  end		 
end
