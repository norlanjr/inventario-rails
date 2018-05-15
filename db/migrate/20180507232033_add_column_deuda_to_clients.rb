class AddColumnDeudaToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :deuda, :string
  end
end
