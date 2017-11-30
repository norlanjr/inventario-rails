class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :cedula
      t.integer :telefono
      t.string :direccion
      t.decimal :credito

      t.timestamps
    end
  end
end
