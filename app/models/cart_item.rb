class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def syoukei
    (self.item.price * 1.1 * self.amount).round(0)
  end

end
