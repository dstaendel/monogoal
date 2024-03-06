class Goal < ApplicationRecord
  belongs_to :user
  has_many :subtasks

  validates :title, presence: true
  validates :title, uniqueness: true
end
