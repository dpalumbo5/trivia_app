class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :points, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :games, :users
    #first table belongs to the second table
  end
end
