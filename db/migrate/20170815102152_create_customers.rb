class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :atm_number
      t.integer :atm_pin
      t.integer :balance
      t.string :references
      t.string :bank

      t.timestamps null: false
    end
  end
end
