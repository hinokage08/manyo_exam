class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  belongs_to :user
end
