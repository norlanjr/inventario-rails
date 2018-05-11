class ChangeColumnDeudaFromStringToDecimal < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients,:deuda,:string
    add_column :clients,:deuda,:decimal
    
  end
end
