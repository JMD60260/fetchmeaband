class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.string :topic
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
