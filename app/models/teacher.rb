class Teacher < ApplicationRecord
  belongs_to :user
  enum :gender, {male: "male", female: "female"}
  enum :subject_name, {hindi: "hindi" , english: "english" , mathes: "mathes", science: "science" , evm: "evm"}
end
