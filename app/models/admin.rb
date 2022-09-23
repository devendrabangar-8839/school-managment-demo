class Admin < ApplicationRecord
  belongs_to :user

  has_many :students
  has_many :teachers
  
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  has_one :address, :as => :addressable
  has_one :contact, :as => :contactable
end
