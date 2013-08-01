class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :subcategory

  mount_uploader :photo, AvatarUploader

  validates_presence_of :title, :body, :price, :location
end
