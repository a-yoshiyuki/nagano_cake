class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer

  enum payment: { クレジットカード: 0, 銀行振込: 1 }

  def syoukei
    (self.order_items.price * 1.1 * self.quantity.to_i).round(0)
  end
end
