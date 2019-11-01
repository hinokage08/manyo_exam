class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum:30 }
  validates :content, presence: true
end
