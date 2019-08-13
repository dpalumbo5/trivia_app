class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id, null: false, index: true
      t.boolean :is_correct, null: false
      t.integer :round_id, null: false, index: true
      t.text    :users_answer, null:false
    end
    add_foreign_key(:responses, :questions)
    add_foreign_key(:responses, :rounds)
  end
end
