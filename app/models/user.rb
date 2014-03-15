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
end
