class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :article, foreign_key: true
      t.decimal :existencia
      t.decimal :existencia_minima

      t.timestamps
    end
  end
end
