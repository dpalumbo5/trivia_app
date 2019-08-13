class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :response_id, null: false, index: true
      t.integer :points, null: false
    end
    add_foreign_key(:scores, :responses)
  end
end
