class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :title, presence: true
  before_save :ensure_progression

  def calculate_completion_pct
    completed_tasks = tasks.where(is_done: true).count
    total_tasks = tasks.count
    (completed_tasks.to_f / total_tasks) * 100
  end

 private

  def ensure_progression
    new_completion_pct = calculate_completion_pct
    if new_completion_pct < self.current_completion_pct
      errors.add(:base, "Tree cannot shrink!")
      throw :abort
    else
      self.completion_image = determine_tree_image(new_completion_pct)
      self.current_completion_pct = new_completion_pct
    end
  end

  def determine_tree_image(completion_pct)
    # Implementation remains the same as previously described
  end
end
