class Task < ApplicationRecord
  belongs_to :goal
  attr_accessor :skip_callbacks # Temporary attribute, not persisted

  after_commit :set_new_percentage, on: %i[create destroy]
  after_commit :update_percentage, on: %i[update], unless: -> { skip_callbacks }

  private

  def set_new_percentage
    untouched_tasks = goal.tasks.where(is_percentage_manual: false)
    total_tasks = untouched_tasks.count

    return if total_tasks.zero?

    new_percentage_per_task = (100.0 / total_tasks).round.to_i
    untouched_tasks.update_all(percentage: new_percentage_per_task)
  end

  # TODO buil scale limit with max 100 percent

  def update_percentage
    self.skip_callbacks = true
    self.update(is_percentage_manual: true)

    remaining_percentage = 100 - goal.tasks.where(is_percentage_manual: true).sum(:percentage)
    remaining_tasks = goal.tasks.where(is_percentage_manual: false)

    if remaining_tasks.any?
      new_percentage_after_update = remaining_percentage / remaining_tasks.count
      remaining_tasks.each do |task|
        task.skip_callbacks = true # Prevent callback loop
        task.update(percentage: new_percentage_after_update.round)
      end
    end
    self.skip_callbacks = false # Reset flag
  end
end
