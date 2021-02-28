require "test_helper"

class CasecategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casecategory = casecategories(:one)
  end

  test "should get index" do
    get casecategories_url
    assert_response :success
  end

  test "should get new" do
    get new_casecategory_url
    assert_response :success
  end

  test "should create casecategory" do
    assert_difference('Casecategory.count') do
      post casecategories_url, params: { casecategory: { caption: @casecategory.caption, tag: @casecategory.tag } }
    end

    assert_redirected_to casecategory_url(Casecategory.last)
  end

  test "should show casecategory" do
    get casecategory_url(@casecategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_casecategory_url(@casecategory)
    assert_response :success
  end

  test "should update casecategory" do
    patch casecategory_url(@casecategory), params: { casecategory: { caption: @casecategory.caption, tag: @casecategory.tag } }
    assert_redirected_to casecategory_url(@casecategory)
  end

  test "should destroy casecategory" do
    assert_difference('Casecategory.count', -1) do
      delete casecategory_url(@casecategory)
    end

    assert_redirected_to casecategories_url
  end
end
