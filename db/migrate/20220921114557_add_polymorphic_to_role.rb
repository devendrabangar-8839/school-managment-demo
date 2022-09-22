class AddPolymorphicToRole < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :address_id
    add_reference :teachers, :address_id
    add_reference :admins, :address_id
  end
end
