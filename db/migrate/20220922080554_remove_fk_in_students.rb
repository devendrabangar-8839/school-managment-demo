class RemoveFkInStudents < ActiveRecord::Migration[7.0]
  def update
   remove_foreign_key :students, :address_id_id
  end
end
