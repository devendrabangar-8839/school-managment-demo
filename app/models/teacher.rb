class Teacher < ApplicationRecord
  
  belongs_to :user
  has_many :classnamess
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable
  validates :name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :salery, presence: true
  validates :subject_name, presence: true
  
  enum :gender, {male: "male", female: "female"}
  enum :subject_name, {hindi: "hindi" , english: "english" , mathes: "mathes", science: "science" , evm: "evm"}
end
