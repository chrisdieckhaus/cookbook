class Recipe < ActiveRecord::Base
	has_many :reviews
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true
end
