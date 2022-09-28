class Admin < ApplicationRecord
  belongs_to :user

  has_many :students
  has_many :teachers
  
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates_length_of :contact_number, is: 10,  message: "Number must be 10 digit long"  
  validates :address, presence: true

end
