class AddSkypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :skype, :string
  end
end
