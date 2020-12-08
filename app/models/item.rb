class Item < ApplicationRecord
   attachment :image

   has_many :cart_items, dependent: :destroy

  def syouhizei
    (self.price * 1.1).round(0)
  end

end
