class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def syoukei
    (self.item.price * 1.1 * self.quantity.to_i).round(0)
  end

  def tannka
    (self.purchase_price * 1.1).round(0)
  end
end
