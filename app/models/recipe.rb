class Recipe < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true

	def avg_rating
		sum = 0
		self.reviews.each do |review|
			sum += review.rating
		end
		avg = sum.to_f/self.reviews.count.to_f
		avg
	end
end
