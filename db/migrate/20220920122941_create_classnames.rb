class CreateClassnames < ActiveRecord::Migration[7.0]
  def change
    create_table :classnames do |t|
      t.string :class_name
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
