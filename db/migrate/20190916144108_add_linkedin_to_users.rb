# frozen_string_literal: true

class AddLinkedinToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :linkedin, :string
  end
end
