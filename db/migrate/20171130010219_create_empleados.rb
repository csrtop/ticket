class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string :empleado
      t.integer :club_id
      t.integer :departamento_id

      t.timestamps
    end
  end
end
