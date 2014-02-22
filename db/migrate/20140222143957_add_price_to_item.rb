class AddPriceToItem < ActiveRecord::Migration
  def change
    add_column :items, :price, :float
  end
end
