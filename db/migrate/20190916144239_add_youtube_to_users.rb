# frozen_string_literal: true

class AddYoutubeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :youtube, :string
  end
end
