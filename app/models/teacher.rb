class Teacher < ApplicationRecord
  
  belongs_to :user
  validates :name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :salery, presence: true
  validates :subject_name, presence: true
  
  enum :gender, {male: "male", female: "female"}
  enum :subject_name, {hindi: "hindi" , english: "english" , mathes: "mathes", science: "science" , evm: "evm"}
end
