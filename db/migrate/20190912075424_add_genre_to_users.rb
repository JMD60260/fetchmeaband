# frozen_string_literal: true

class AddGenreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :genre, :string
  end
end
