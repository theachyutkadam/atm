class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :reciever_id
      t.integer :sender_id
      t.references :customer, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true
      t.references :atm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
