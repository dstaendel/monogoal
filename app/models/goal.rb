require 'date'

class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  after_commit :calculate_progress, on: %i[update]

  def calculate_progress
    completed_tasks = tasks.where(done: true).count
    total_tasks = tasks.count
    progress = (completed_tasks.to_f / total_tasks) * 100
  end

  def remaining_days
    goal = Goal.last
    seconds = (goal.end_time - DateTime.now).to_i
    days = seconds / (60 * 60 * 24)
  end

  def image_progress
    case progress
    when 0
      "SEED.svg"
    when 0.1..24.99
      "PLANT-1.svg"
    when 25..49.99
      "PLANT-2.svg"
    when 50..74.99
      "PLANT-3.svg"
    when 75..99.99
      "PLANT-4.svg"
      # Should have the celebration animation. Needs to be activated by user:
    when 100
      "PLANT-4.svg"
      # Default image. Not set yet.
    else
      "PLANT-4.svg"
    end
  end
end
