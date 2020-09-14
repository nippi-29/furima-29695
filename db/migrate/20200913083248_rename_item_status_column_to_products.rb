class RenameItemStatusColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :item_status, :item_status_id
  end
end
