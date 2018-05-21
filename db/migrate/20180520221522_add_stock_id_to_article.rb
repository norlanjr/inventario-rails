class AddStockIdToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :stock, foreign_key: true
  end
end
