class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
