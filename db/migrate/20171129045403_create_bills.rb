class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.string :estado
      t.decimal :total
      t.decimal :saldo
      t.datetime :fecha_limite

      t.timestamps
    end
  end
end
