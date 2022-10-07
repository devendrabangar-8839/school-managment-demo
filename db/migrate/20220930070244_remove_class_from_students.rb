class RemoveClassFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :class
  end
end
