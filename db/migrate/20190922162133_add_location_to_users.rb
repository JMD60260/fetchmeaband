# frozen_string_literal: true

class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :string
  end
end
