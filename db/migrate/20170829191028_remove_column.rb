class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :transfers, :customer_id
  end
end
