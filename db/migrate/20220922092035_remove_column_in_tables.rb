class RemoveColumnInTables < ActiveRecord::Migration[7.0]
  def update
    remove_column :admins, :address_id_id
    remove_column :students, :address_id_id
    remove_column :teachers, :address_id_id
  end
end
