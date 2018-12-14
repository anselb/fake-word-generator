class AddNameToOrderList < ActiveRecord::Migration[5.2]
  def change
    add_column :order_lists, :name, :string
  end
end
