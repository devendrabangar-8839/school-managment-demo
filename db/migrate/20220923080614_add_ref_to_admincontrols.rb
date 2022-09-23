class AddRefToAdmincontrols < ActiveRecord::Migration[7.0]
  def change
  
      add_reference :admincontrols, :student
      add_reference :admincontrols, :teacher
  end
end
