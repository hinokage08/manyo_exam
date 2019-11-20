class Label < ApplicationRecord
  validates :name, presence: true, length: { maximum:15 }

  has_many :labellings, dependent: :destroy
  belongs_to :user
end
