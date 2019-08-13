class Questions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :answers, null: false
      t.string :categories, null: false
      t.timestamps
      #need to specify these to set the created_at and updated_at
    end
  end
end
