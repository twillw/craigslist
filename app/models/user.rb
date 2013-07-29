class User < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name, :email, :password, :phone_number
  validates_uniqueness_of :name
end
