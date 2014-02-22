class ReceiptEntry < ActiveRecord::Base

  belongs_to :item
  belongs_to :receipt

end
