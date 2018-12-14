class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.text :order
      t.array :order_array

      t.timestamps
    end
  end
end
