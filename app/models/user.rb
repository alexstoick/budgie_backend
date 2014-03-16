class User < ActiveRecord::Base

  has_many :receipts
  has_many :wishlist_entries
  has_many :wished_items,
        through: :wishlist_entries,
        class_name:  :Item ,
        foreign_key: :item_id,
        source: :item
  has_many :devices

  def full_name
    return first_name + last_name
  end

  def checkLastReceipt

    receipt = receipts.last
    receipt_items = receipt.items

    items_not_bought = wished_items

    ids = receipt_items.map{|x| x.id}
    puts ids
    new_wished_items = wished_items.reject{|x| ids.include? x.id}

    removed_items = wished_items - new_wished_items
    removed_items.each do |removed_item|
      wishlist_entry = WishlistEntry.where(
        user_id: id,
        item_id: removed_item.id
      ).first
      wishlist_entry.destroy unless wishlist_entry.nil?
    end
    puts removed_items.inspect
    devices.each do |device|
      device.send_notification( new_wished_items )
    end

  end
end
