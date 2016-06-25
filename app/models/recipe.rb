class Recipe < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true
	#validates :category, presence: true

	def avg_rating
		if self.reviews.count.to_f == 0
			return 0
		end
		sum = 0
		self.reviews.each do |review|
			sum += review.rating
		end
		avg = sum.to_f/self.reviews.count.to_f
		avg
	end

	def self.search(search)
		if Rails.env.production?
			where("title ILIKE ? OR ingredients ILIKE ?", "%#{search}%", "%#{search}%")
		else
			where("title LIKE ? OR ingredients LIKE ?", "%#{search}%", "%#{search}%")
		end
	end
end
