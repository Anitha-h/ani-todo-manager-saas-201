class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, { presence: true, uniqueness: true }
  has_secure_password
  has_many :todos
end
