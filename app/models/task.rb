class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  validates :task_name, presence: true, length: { maximum:30 }
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence:true
  validates :status, presence:true

  enum status: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]

  scope :name_search, -> task_name {
    next if task_name.blank?
    where("task_name LIKE ?", "%#{task_name}%")
  }

  scope :status_search, -> status {
    next if status.blank?
    where(status: status)
  }

  scope :label_search, -> label {
    next if label.blank?
    where(id: Labelling.where(label_id: label).pluck(:task_id))
  }
end
