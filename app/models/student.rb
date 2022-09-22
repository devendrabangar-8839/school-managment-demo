class Student < ApplicationRecord
  
  belongs_to :user
  has_one :classname
  has_one :address, :as => :addressable
  has_one :contact, :as => :contactable
  validates :name, presence: true
  validates :father_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :roll_no, presence: true
  validates :user_id, presence: true
  accepts_nested_attributes_for :address
end
