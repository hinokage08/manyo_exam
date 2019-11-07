class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum:30 }
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence:true
  validates :status, presence:true

  enum status: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]
end
