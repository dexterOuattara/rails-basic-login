require "test_helper"

class InterviewcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interviewcategory = interviewcategories(:one)
  end

  test "should get index" do
    get interviewcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_interviewcategory_url
    assert_response :success
  end

  test "should create interviewcategory" do
    assert_difference('Interviewcategory.count') do
      post interviewcategories_url, params: { interviewcategory: { caption: @interviewcategory.caption, tag: @interviewcategory.tag } }
    end

    assert_redirected_to interviewcategory_url(Interviewcategory.last)
  end

  test "should show interviewcategory" do
    get interviewcategory_url(@interviewcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_interviewcategory_url(@interviewcategory)
    assert_response :success
  end

  test "should update interviewcategory" do
    patch interviewcategory_url(@interviewcategory), params: { interviewcategory: { caption: @interviewcategory.caption, tag: @interviewcategory.tag } }
    assert_redirected_to interviewcategory_url(@interviewcategory)
  end

  test "should destroy interviewcategory" do
    assert_difference('Interviewcategory.count', -1) do
      delete interviewcategory_url(@interviewcategory)
    end

    assert_redirected_to interviewcategories_url
  end
end
