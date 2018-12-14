class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.text :order
      t.text :order_array, array: true

      t.timestamps
    end
  end
end
