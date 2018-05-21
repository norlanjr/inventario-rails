class AddColumnCantidadToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :cantidad, :decimal
  end
end
