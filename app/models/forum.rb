class Forum < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :comment, length: { maximum: 1000 }, :allow_nil => true, on: :update
end
