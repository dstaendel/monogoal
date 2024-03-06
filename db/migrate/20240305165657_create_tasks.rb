class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :percentage
      t.boolean :done, default: false
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
