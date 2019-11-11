class Task < ApplicationRecord
  belongs_to :user

  validates :task_name, presence: true, length: { maximum:30 }
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence:true
  validates :status, presence:true

  enum status: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]

  scope :task_name_search, -> task_name { where("task_name LIKE ?", "%#{task_name}%") }
  scope :status_search, -> status { where(status: status) }
end
