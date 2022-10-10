class Teacher < ApplicationRecord
  
  belongs_to :user
  has_many :classnamess
  has_many :student_teachers
  has_many :students, through: :student_teachers 
  
  has_many :admincontrols
  has_many :students, through: :admincontrols

  validates :name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :salery, presence: true
  validates :subject_name, presence: true
  validates_length_of :contact_number, is: 10,  message: "Number must be 10 digit long"  
  validates :address, presence: true
  
  enum :gender, {male: "male", female: "female"}
  #enum :subject_name, {hindi: "hindi" , english: "english" , mathes: "mathes", science: "science" , evm: "evm"}
end
