# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: { message: 'évènement doit être dans le futur' }
  validate :future_event
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: { message: 'vous devez rentrer un lieu' }

  def message_time
    start_date.strftime('%d/%m/%y | %l:%M %p')
  end

  def the_end
    @end = (start_date + duration.minute)
    @the_end = @end.strftime('%d/%m/%y | %l:%M %p')
  end

  private

  def future_event
    if start_date.nil?
      puts ''
    else
      errors.add(:date, "L'évènement ne peut pas avoir lieu dans le passé !") if start_date < Time.now
    end
  end
end
