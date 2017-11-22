class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.references :article, foreign_key: true
      t.decimal :cantidad
      t.decimal :precio
      t.decimal :descuneto
      t.decimal :sub_total
      t.decimal :total

      t.timestamps
    end
  end
end
