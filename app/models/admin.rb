class Admin < ApplicationRecord
  belongs_to :user

  has_many :students
  has_many :teachers
  
  validates :gender, presence: true
  validates :date_of_birth, presence: true

end
