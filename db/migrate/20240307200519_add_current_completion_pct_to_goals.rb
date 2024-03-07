class AddCurrentCompletionPctToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :current_completion_pct, :float
  end
end
