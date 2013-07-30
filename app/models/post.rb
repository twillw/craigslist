class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates_presence_of :title, :body, :price, :location
end
