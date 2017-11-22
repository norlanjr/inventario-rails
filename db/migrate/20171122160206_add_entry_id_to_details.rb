class AddEntryIdToDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :details, :entry, foreign_key: true
  end
end
