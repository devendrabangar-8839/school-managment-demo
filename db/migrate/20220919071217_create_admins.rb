class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :gender
      t.datetime :date_of_birth
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
