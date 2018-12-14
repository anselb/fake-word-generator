require "application_system_test_case"

class ComponentListsTest < ApplicationSystemTestCase
  setup do
    @component_list = component_lists(:one)
  end

  test "visiting the index" do
    visit component_lists_url
    assert_selector "h1", text: "Component Lists"
  end

  test "creating a Component list" do
    visit component_lists_url
    click_on "New Component List"

    fill_in "Components", with: @component_list.components
    fill_in "Components Array", with: @component_list.components_array
    click_on "Create Component list"

    assert_text "Component list was successfully created"
    click_on "Back"
  end

  test "updating a Component list" do
    visit component_lists_url
    click_on "Edit", match: :first

    fill_in "Components", with: @component_list.components
    fill_in "Components Array", with: @component_list.components_array
    click_on "Update Component list"

    assert_text "Component list was successfully updated"
    click_on "Back"
  end

  test "destroying a Component list" do
    visit component_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Component list was successfully destroyed"
  end
end
