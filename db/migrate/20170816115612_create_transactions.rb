class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.decimal :balance
      t.references :customer, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true
      t.references :atm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
