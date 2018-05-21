class AddDetailIdToStocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :detail, foreign_key: true
  end
end
