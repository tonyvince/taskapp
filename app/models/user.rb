require 'validators/email_validator'

class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }, on: :create
end
