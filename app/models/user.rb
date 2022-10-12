class User < ApplicationRecord
  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do |user|
    puts "You have found an object!"
  end
  
  has_secure_password

  validates :email, uniqueness: true
  # validates :password_digest, presence: true

  has_one :student
  has_one :teacher
  has_one :admin
  enum :role, {student: "student" , teacher: "teacher", admin: "admin" }

  def is_admin_jd?
    self.role == 'admin'
  end
end
