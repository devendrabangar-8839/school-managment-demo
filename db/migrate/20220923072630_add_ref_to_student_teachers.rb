class AddRefToStudentTeachers < ActiveRecord::Migration[7.0]
  def change

      add_reference :student_teachers, :student
      add_reference :student_teachers, :teacher

  end
end
