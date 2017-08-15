class CreateAtms < ActiveRecord::Migration
  def change
    create_table :atms do |t|
      t.references :bank, index: true, foreign_key: true
      t.string :location

      t.timestamps null: false
    end
  end
end
