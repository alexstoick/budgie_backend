class Receipt < ActiveRecord::Base

  has_many :receipt_entries
  has_many :items, through: :receipt_entries
  belongs_to :table
  belongs_to :user

  def total
    items = self.items

    total = 0.0
    items.each do |item|
      total = total + item.price
    end
    total.round(2).to_s
  end

  def receipt_day
    Date.today - self.id
  end

end
