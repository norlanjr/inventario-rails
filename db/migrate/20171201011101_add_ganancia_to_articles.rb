class AddGananciaToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :ganancia, :decimal
  end
end
