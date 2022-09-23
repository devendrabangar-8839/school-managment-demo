class CreateAdmincontrols < ActiveRecord::Migration[7.0]
  def change
    create_table :admincontrols do |t|
      add_reference :admincontrols, :student
      add_reference :admincontrols, :teacher
      t.timestamps
    end
  end
end
