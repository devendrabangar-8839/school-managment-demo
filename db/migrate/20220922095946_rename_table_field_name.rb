class RenameTableFieldName < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :address, :address_name
    rename_column :contacts, :contact, :contact_name

  end
end
