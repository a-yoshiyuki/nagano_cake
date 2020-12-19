class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer

  enum payment: { クレジットカード: 0, 銀行振込: 1 }

 
end
