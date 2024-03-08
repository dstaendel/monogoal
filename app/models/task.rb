class Task < ApplicationRecord
  belongs_to :goal
  # attr_accessor :skip_callbacks # Temporary attribute, not persisted

  after_commit :set_new_percentage, on: %i[create destroy]

  private

  def set_new_percentage
    total_tasks = goal.tasks.count
    new_percentage_per_task = (100.0 / total_tasks)
    goal.tasks.update_all(percentage: new_percentage_per_task)
  end
end
