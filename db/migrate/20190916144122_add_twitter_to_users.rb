# frozen_string_literal: true

class AddTwitterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :twitter, :string
  end
end
