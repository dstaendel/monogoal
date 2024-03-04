class Goal < ApplicationRecord
  belongs_to :user_id
  has_many :subtasks
end
