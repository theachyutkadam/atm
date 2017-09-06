class AddColumnBalance < ActiveRecord::Migration
  def change
  	add_column :transfers, :customer_id, :decimal
  end
end
