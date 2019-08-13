class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :topic_id, null: false, index: true
      t.integer :game_id, null:false, index: true
    end
    add_foreign_key(:rounds, :topics)
    add_foreign_key(:rounds, :games)
  end
end
