require "application_system_test_case"

class OrderListsTest < ApplicationSystemTestCase
  setup do
    @order_list = order_lists(:one)
  end

  test "visiting the index" do
    visit order_lists_url
    assert_selector "h1", text: "Order Lists"
  end

  test "creating a Order list" do
    visit order_lists_url
    click_on "New Order List"

    fill_in "Order", with: @order_list.order
    fill_in "Order Array", with: @order_list.order_array
    click_on "Create Order list"

    assert_text "Order list was successfully created"
    click_on "Back"
  end

  test "updating a Order list" do
    visit order_lists_url
    click_on "Edit", match: :first

    fill_in "Order", with: @order_list.order
    fill_in "Order Array", with: @order_list.order_array
    click_on "Update Order list"

    assert_text "Order list was successfully updated"
    click_on "Back"
  end

  test "destroying a Order list" do
    visit order_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order list was successfully destroyed"
  end
end
