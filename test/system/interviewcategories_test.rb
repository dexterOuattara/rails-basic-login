require "application_system_test_case"

class InterviewcategoriesTest < ApplicationSystemTestCase
  setup do
    @interviewcategory = interviewcategories(:one)
  end

  test "visiting the index" do
    visit interviewcategories_url
    assert_selector "h1", text: "Interviewcategories"
  end

  test "creating a Interviewcategory" do
    visit interviewcategories_url
    click_on "New Interviewcategory"

    fill_in "Caption", with: @interviewcategory.caption
    fill_in "Tag", with: @interviewcategory.tag
    click_on "Create Interviewcategory"

    assert_text "Interviewcategory was successfully created"
    click_on "Back"
  end

  test "updating a Interviewcategory" do
    visit interviewcategories_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @interviewcategory.caption
    fill_in "Tag", with: @interviewcategory.tag
    click_on "Update Interviewcategory"

    assert_text "Interviewcategory was successfully updated"
    click_on "Back"
  end

  test "destroying a Interviewcategory" do
    visit interviewcategories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interviewcategory was successfully destroyed"
  end
end
