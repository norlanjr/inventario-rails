class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :nombre
      t.integer :telefono
      t.string :empresa
      t.string :ruc_empresa

      t.timestamps
    end
  end
end
