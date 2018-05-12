class CreateClubes < ActiveRecord::Migration[5.1]
  def change
    create_table :clubes do |t|
      t.integer :club
      t.string :nombre

      t.timestamps
    end
  end
end
