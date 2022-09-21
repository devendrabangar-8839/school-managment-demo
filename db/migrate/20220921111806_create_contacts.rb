class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.integer :contact
      t.references :contactable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
