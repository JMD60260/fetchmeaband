class Comment < ApplicationRecord

<<<<<<< HEAD
		validates :content,
			   presence: true
			   validates : length: { minimum: 2 }		   
=======
	validates :content,
	    presence: true
>>>>>>> e03ca5244233e029ce6e77c3dc28ce14b1b6851e

	belongs_to :user
	belongs_to :forum

end
