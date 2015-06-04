class Recipe < ActiveRecord::Base
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true
end