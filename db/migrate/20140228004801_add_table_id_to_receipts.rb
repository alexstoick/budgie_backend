class AddTableIdToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :table_id, :integer
  end
end
