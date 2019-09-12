class Comment < ApplicationRecord

		validates :content,
			   presence: true
			   validates : length: { minimum: 2 }		   

	belongs_to :user
	belongs_to :forum

end
