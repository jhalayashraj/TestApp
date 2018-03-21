class Review < ApplicationRecord

	## Associations 
	belongs_to :comment
	belongs_to :user

end
