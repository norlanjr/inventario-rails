class AddStockIdToDetail < ActiveRecord::Migration[5.1]
  def change
    add_reference :details, :stock, foreign_key: true
  end
end
