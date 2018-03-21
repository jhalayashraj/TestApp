class Post < ApplicationRecord

	## Associations
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy

	## Nested
	accepts_nested_attributes_for :comments, allow_destroy: true

	def get_likes user_id
		return likes.where(user_id: user_id)
	end

end
