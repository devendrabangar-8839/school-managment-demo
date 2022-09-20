class Classname < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  enum :class_name, {sixth: "6th" , seventh: "7th" , eighth: "8th" , nineth: "9th" , tenth: "10th"}
end
