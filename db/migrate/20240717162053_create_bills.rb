class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.decimal :amount
      t.string :bill_type
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
