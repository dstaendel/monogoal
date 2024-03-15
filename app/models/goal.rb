class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  after_commit :calculate_progress, on: %i[update]

  def calculate_progress
    completed_tasks = tasks.where(done: true).count
    total_tasks = tasks.count
    (completed_tasks.to_f / total_tasks) * 100
  end

  def remaining_days
    (end_time.to_date - Date.today).to_i
  end
end
