class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :shipping, null: false, default: ""
      t.string :billing_amount, null: false, default: ""
      t.integer :status, null: false
      t.integer :payment, null: false

      t.timestamps
    end
  end
end
