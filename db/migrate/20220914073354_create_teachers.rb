class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :gender
      t.datetime :date_of_birth
      t.string :salery
      t.string :subject_name

      t.timestamps
    end
  end
end
