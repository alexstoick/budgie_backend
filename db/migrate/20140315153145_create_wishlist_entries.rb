class CreateWishlistEntries < ActiveRecord::Migration
  def change
    create_table :wishlist_entries do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
