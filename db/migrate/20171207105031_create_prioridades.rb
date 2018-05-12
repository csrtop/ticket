class CreatePrioridades < ActiveRecord::Migration[5.1]
  def change
    create_table :prioridades do |t|
      t.string :prioridad

      t.timestamps
    end
  end
end
