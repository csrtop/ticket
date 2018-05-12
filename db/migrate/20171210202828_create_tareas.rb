class CreateTareas < ActiveRecord::Migration[5.1]
  def change
    create_table :tareas do |t|
      t.integer :empleado_id
      t.integer :tipo_id
      t.integer :estado_id
      t.integer :prioridad_id
      t.text :comentario
      t.timestamps
    end
  end
end
