class User < ApplicationRecord
  has_secure_password

  validates :email, presence:true
  # validates :password_digest, presence: true

  has_one :student
  has_one :teacher
  has_one :admin
  enum :role, {student: "student" , teacher: "teacher", admin: "admin" }

  # def is_admin_jd?
  #   self.role == 'admin'
  # end
end
