class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :father_name
      t.string :gender
      t.datetime :date_of_birth
      t.string :roll_no

      t.timestamps
    end
  end
end
