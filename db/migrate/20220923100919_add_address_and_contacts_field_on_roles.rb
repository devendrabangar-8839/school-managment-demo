class AddAddressAndContactsFieldOnRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :contact_number, :integer
    add_column :students, :address, :string
    add_column :teachers, :contact_number, :integer
    add_column :teachers, :address, :string
    add_column :admins, :contact_number, :integer
    add_column :admins, :address, :string
  end
end
