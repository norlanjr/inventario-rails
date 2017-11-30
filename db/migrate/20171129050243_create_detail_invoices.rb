class CreateDetailInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_invoices do |t|
      t.references :bill, foreign_key: true
      t.references :article, foreign_key: true
      t.decimal :cantidad
      t.decimal :sub_total

      t.timestamps
    end
  end
end
