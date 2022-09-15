class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  # validates :password_digest, presence: true

  has_one :student
  has_one :teacher
  enum :role, {student: "student" , teacher: "teacher" , admin: "admin"}
end
