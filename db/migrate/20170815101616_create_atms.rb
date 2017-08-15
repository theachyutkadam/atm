class CreateAtms < ActiveRecord::Migration
  def change
    create_table :atms do |t|
      t.string :location
      t.string :references
      t.string :bank

      t.timestamps null: false
    end
  end
end
