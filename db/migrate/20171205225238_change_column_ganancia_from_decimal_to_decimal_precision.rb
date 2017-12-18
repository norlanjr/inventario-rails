class ChangeColumnGananciaFromDecimalToDecimalPrecision < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles,:ganancia,:decimal
    add_column :articles,:ganancia,:decimal,:precision =>8,:scale =>2
    
  end
end
