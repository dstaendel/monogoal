class CreateSubtasks < ActiveRecord::Migration[7.1]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.integer :percentage
      t.boolean :done, default: false
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
