class RenameTransactionIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :transaction_id, :product_id
  end
end
