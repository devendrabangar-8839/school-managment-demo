class AddPolymorphicToRole < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :address, foreign_key: true
    add_reference :teachers, :address, foreign_key: true
    add_reference :admins, :address, foreign_key: true
  end
end
