class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :nombre
      t.string :descripcion
      t.decimal :precio
      t.decimal :precio2
      t.decimal :costo

      t.timestamps
    end
  end
end
