class Recipe < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :directions, presence: true
	validates :category, presence: true
	CATEGORIES = [
		'appetizer',
		'beef',
		'bread',
		'breakfast',
		'burger',
		'chicken',
		'dessert',
		'drink',
		'fruit',
		'pasta',
		'pizza',
		'pork',
		'rice',
		'salad',
		'sandwich',
		'sauce',
		'seafood',
		'snacks',
		'soup',
		'tacos',
		'vegetable',
		'vegetarian'
	]

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
		like = Rails.env.production? ? "ILIKE" : "LIKE"
		users = User.where("first_name #{like} ? OR last_name #{like} ?", "%#{search}%", "%#{search}%")
		#u is collection of users
		uids = users.map{|u| u.id}
		q1 = ""
		q2 = []
		uids.each do |u|
			q1 += "user_id = ? OR "
			q2.push("#{u}")
		end
		q1 += "title #{like} ? OR ingredients #{like} ?"
		q2.push("%#{search}%")
		q2.push("%#{search}%")
		where(q1, *q2)
	end
end
