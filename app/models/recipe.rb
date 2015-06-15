class Recipe < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true
	#validates :category, presence: true

	def avg_rating
		if self.reviews.count.to_f == 0
			return "not reviewed"
		end
		sum = 0
		self.reviews.each do |review|
			sum += review.rating
		end
		avg = sum.to_f/self.reviews.count.to_f
		avg
	end
end
