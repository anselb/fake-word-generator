require 'test_helper'

class ComponentListTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should have the necessary required validators" do
    component_list = ComponentList.new
    assert_not component_list.valid?
    assert_equal [:name, :components], component_list.errors.keys
  end

  test "should have numeric score" do
    component_list = ComponentList.new(name: 'test', components: 'a b3 c')
    assert_not component_list.valid?
    assert_equal ["word components only allow letters"], component_list.errors.messages[:components]
  end
end
