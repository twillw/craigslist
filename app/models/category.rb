class Category < ActiveRecord::Base
	has_many :subcategories
	def self.allowed_types
	    [
	      'For Sale', 'Jobs', 'Housing'
	    ]
	end
end
