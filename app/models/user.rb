class User < ApplicationRecord

  has_one :student
  has_one :teacher
  enum :role, {student: "student" , teacher: "teacher" , admin: "admin"}
end
