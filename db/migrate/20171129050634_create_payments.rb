class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :bill, foreign_key: true
      t.decimal :cantidad

      t.timestamps
    end
  end
end
