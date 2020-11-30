class CartItem < ApplicationRecord
  attachment :image

  def syouhizei
    (self.price * 1.1).round(0)
  end
end
