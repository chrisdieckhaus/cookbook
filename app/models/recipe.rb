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
			users = User.where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
			#u is collection of users
			uids = users.map{|u| u.id}
			q1 = ""
			q2 = []
			uids.each do |u|
				q1 += "user_id = ? OR "
				q2.push("#{u}")
			end
			q1 += "title LIKE ? OR ingredients LIKE ?"
			q2.push("%#{search}%")
			q2.push("%#{search}%")
			where(q1, *q2)
		end
	end
end
