class City < ActiveRecord::Base
	has_many :posts

	def self.allowed_types
    [
      'Toronto', 'Ottawa', 'Montreal', 'Winnipeg', 'Regina', 'Edmonton', 'Calgary', 'Victoria', 'Vancouver', 
      'Quebec City', 'Kingston', 'Kitchener-Waterloo', 'Halifax'
    ]
	end

	validates :name, presence: true, inclusion: { :in => City.allowed_types }
end
