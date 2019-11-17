class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  before_destroy :last_admin_not_delete
  before_update :last_admin_not_change

  has_many :tasks, dependent: :destroy

  has_secure_password

  def last_admin_not_delete
    throw(:abort) if User.where(admin: true).length == 1 && self.admin?
  end

  def last_admin_not_change
    if User.where(admin: true).length == 0
    end
  end
end
