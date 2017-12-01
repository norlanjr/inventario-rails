class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles,:state
  end
end
