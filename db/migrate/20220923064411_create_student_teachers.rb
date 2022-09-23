class CreateStudentTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :student_teachers do |t|



      t.timestamps
    end
  end
end
