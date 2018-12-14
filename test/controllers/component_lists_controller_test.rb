require 'test_helper'

class ComponentListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_list = component_lists(:one)
  end

  test "should get index" do
    get component_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_component_list_url
    assert_response :success
  end

  test "should create component_list" do
    assert_difference('ComponentList.count') do
      post component_lists_url, params: { component_list: { components: @component_list.components, components_array: @component_list.components_array } }
    end

    assert_redirected_to component_list_url(ComponentList.last)
  end

  test "should show component_list" do
    get component_list_url(@component_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_list_url(@component_list)
    assert_response :success
  end

  test "should update component_list" do
    patch component_list_url(@component_list), params: { component_list: { components: @component_list.components, components_array: @component_list.components_array } }
    assert_redirected_to component_list_url(@component_list)
  end

  test "should destroy component_list" do
    assert_difference('ComponentList.count', -1) do
      delete component_list_url(@component_list)
    end

    assert_redirected_to component_lists_url
  end
end
