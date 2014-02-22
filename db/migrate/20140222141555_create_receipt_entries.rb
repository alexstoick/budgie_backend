class CreateReceiptEntries < ActiveRecord::Migration
  def change
    create_table :receipt_entries do |t|
      t.integer :receipt_id
      t.integer :item_id

      t.timestamps
    end
  end
end
