class Admin < ApplicationRecord
  belongs_to :user
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable
end
