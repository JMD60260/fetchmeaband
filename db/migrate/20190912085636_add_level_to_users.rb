# frozen_string_literal: true

class AddLevelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :level, :string
  end
end
