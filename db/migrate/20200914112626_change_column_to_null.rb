class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :addresses, :building, true
  end
end
