class Review < ActiveRecord::Base
  	belongs_to :recipe
  	belongs_to :user
  	validates :rating, presence: true
end
