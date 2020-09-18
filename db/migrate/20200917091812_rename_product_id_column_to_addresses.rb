class RenameProductIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :product_id, :order_id
  end
end
