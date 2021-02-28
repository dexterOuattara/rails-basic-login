require "application_system_test_case"

class CasecategoriesTest < ApplicationSystemTestCase
  setup do
    @casecategory = casecategories(:one)
  end

  test "visiting the index" do
    visit casecategories_url
    assert_selector "h1", text: "Casecategories"
  end

  test "creating a Casecategory" do
    visit casecategories_url
    click_on "New Casecategory"

    fill_in "Caption", with: @casecategory.caption
    fill_in "Tag", with: @casecategory.tag
    click_on "Create Casecategory"

    assert_text "Casecategory was successfully created"
    click_on "Back"
  end

  test "updating a Casecategory" do
    visit casecategories_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @casecategory.caption
    fill_in "Tag", with: @casecategory.tag
    click_on "Update Casecategory"

    assert_text "Casecategory was successfully updated"
    click_on "Back"
  end

  test "destroying a Casecategory" do
    visit casecategories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Casecategory was successfully destroyed"
  end
end
