class AddIsPercentageManualToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :is_percentage_manual, :boolean, default: false
  end
end
