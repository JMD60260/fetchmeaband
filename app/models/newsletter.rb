# frozen_string_literal: true

class Newsletter < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
