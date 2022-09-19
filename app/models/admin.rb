class Admin < ApplicationRecord
  belongs_to :user
  validates :gender, presence: true
  validates :date_of_birth, presence: true
end
