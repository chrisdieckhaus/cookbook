class Review < ActiveRecord::Base
  	belongs_to :recipe
  	validates :rating, presence: true
end
