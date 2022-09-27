class Student < ApplicationRecord
  
  belongs_to :user
  has_one :classname
  has_many :student_teachers
  has_many :teachers, through: :student_teachers, dependent: :destroy

  has_many :admincontrols
  has_many :teachers, through: :admincontrols


  validates :name, presence: true
  validates :father_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :roll_no, presence: true
  validates :user_id, presence: true
end
