class CreateClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :classes do |t|
      t.string :class_name
      t.references :students, foreign_key:true
      t.references :teachers, foreign_key:true

      t.timestamps
    end
  end
end
