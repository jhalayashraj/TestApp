class Comment < ApplicationRecord

	## Associations 
	belongs_to :post
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy

	## Nested
	accepts_nested_attributes_for :reviews, allow_destroy: true

	def get_likes user_id
		return likes.where(user_id: user_id)
	end

end
