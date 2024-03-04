class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :active, default: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :emoji
      t.integer :progress
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
