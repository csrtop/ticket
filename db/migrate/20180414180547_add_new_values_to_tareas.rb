class AddNewValuesToTareas < ActiveRecord::Migration[5.1]
  def change
    add_column :tareas, :club_id, :integer
  end
end
