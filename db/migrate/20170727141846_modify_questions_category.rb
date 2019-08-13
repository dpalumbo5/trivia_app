class ModifyQuestionsCategory < ActiveRecord::Migration
  def change
    remove_column(:questions, :category)
    add_column(:questions, :topic_id, :integer, null: false, index:true)
    add_foreign_key(:questions, :topics)
  end
end
