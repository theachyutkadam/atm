class AddBalanceToTransfers < ActiveRecord::Migration
  def change
    add_column :transfers, :balance, :decimal
  end
end
