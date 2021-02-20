require "application_system_test_case"

class CasestudiesTest < ApplicationSystemTestCase
  setup do
    @casestudy = casestudies(:one)
  end

  test "visiting the index" do
    visit casestudies_url
    assert_selector "h1", text: "Casestudies"
  end

  test "creating a Casestudy" do
    visit casestudies_url
    click_on "New Casestudy"

    fill_in "Category", with: @casestudy.category_id
    fill_in "Description", with: @casestudy.description
    fill_in "Slug", with: @casestudy.slug
    fill_in "Title", with: @casestudy.title
    fill_in "User", with: @casestudy.user_id
    click_on "Create Casestudy"

    assert_text "Casestudy was successfully created"
    click_on "Back"
  end

  test "updating a Casestudy" do
    visit casestudies_url
    click_on "Edit", match: :first

    fill_in "Category", with: @casestudy.category_id
    fill_in "Description", with: @casestudy.description
    fill_in "Slug", with: @casestudy.slug
    fill_in "Title", with: @casestudy.title
    fill_in "User", with: @casestudy.user_id
    click_on "Update Casestudy"

    assert_text "Casestudy was successfully updated"
    click_on "Back"
  end

  test "destroying a Casestudy" do
    visit casestudies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Casestudy was successfully destroyed"
  end
end
