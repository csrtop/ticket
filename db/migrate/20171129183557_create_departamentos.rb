class CreateDepartamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :departamentos do |t|
      t.string :departamento

      t.timestamps
    end
  end
end
