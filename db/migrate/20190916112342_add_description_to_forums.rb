class AddDescriptionToForums < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :forums, :description, :string
  end
end
