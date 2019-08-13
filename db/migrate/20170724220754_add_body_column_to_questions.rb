class AddBodyColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :body, :string, null: false
  end
end
