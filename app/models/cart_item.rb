class CartItem < ApplicationRecord
  attachment :image

  belongs_to :customer
  belongs_to :item

  def syouhizei
    (self.price * 1.1).round(0)
  end
end
