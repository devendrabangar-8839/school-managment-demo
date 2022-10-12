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
  validates :roll_no, presence: true, uniqueness: true
  validates_length_of :contact_number, is: 10,  message: "Number must be 10 digit long"  
  validates :address, presence: true
  validates :user_id, presence: true

 

end
