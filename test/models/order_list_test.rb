require 'test_helper'

class OrderListTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should have the necessary required validators" do
    order_list = OrderList.new
    assert_not order_list.valid?
    assert_equal [:name, :order], order_list.errors.keys
  end
end
