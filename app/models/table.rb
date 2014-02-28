class Table < ActiveRecord::Base

  has_many :receipts

  def last_receipt
    receipts.last
  end
end
