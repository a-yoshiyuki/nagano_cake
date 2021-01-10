class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :purchase_price, null: false
      t.string :quantity, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
