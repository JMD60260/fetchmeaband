class Event < ApplicationRecord
	belongs_to :user

	validates :start_date, presence: { message: "événement doit etre dans le futur"}
	validate :future_event
	validates :title, presence: { message: "titre entre 5 et 140 caracteres"}, length: { minimum: 5, maximum: 140}
	validates :description, presence: { message: "description entre 5 et 1000 caracteres"}, length: { minimum: 5, maximum: 1000}
	validates :price, presence: { message: "entre 1 et 1000 euros"}, numericality: {greater_than: 0, less_than: 1000}
	validates :location, presence: { message: "vous devez rentrer un lieu"}

	def message_time
		start_date.strftime("%d/%m/%y | %l:%M %p")
	end
	def the_end
		@end = (start_date + duration.minute)
		@the_end = @end.strftime("%d/%m/%y | %l:%M %p")
	end

	private

	def future_event
		if start_date == nil
			puts ""
		else
			errors.add(:date, "Can't be in the past!") if start_date < Time.now
		end
	end
end
