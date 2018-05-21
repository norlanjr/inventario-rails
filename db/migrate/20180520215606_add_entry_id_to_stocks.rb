class AddEntryIdToStocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :entry, foreign_key: true
  end
end
