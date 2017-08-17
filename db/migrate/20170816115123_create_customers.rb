class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :atm_no
      t.integer :atm_pin
      t.references :bank, index: true, foreign_key: true
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
