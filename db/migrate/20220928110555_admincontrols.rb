class Admincontrols < ActiveRecord::Migration[7.0]
  def change
    create_table :admincontrols do |t|
      
      t.references :student, foreign_key:true
      t.references :teacher, foreign_key:true

      t.timestamps
    end
  end
end
