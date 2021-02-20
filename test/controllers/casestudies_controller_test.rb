require "test_helper"

class CasestudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casestudy = casestudies(:one)
  end

  test "should get index" do
    get casestudies_url
    assert_response :success
  end

  test "should get new" do
    get new_casestudy_url
    assert_response :success
  end

  test "should create casestudy" do
    assert_difference('Casestudy.count') do
      post casestudies_url, params: { casestudy: { category_id: @casestudy.category_id, description: @casestudy.description, slug: @casestudy.slug, title: @casestudy.title, user_id: @casestudy.user_id } }
    end

    assert_redirected_to casestudy_url(Casestudy.last)
  end

  test "should show casestudy" do
    get casestudy_url(@casestudy)
    assert_response :success
  end

  test "should get edit" do
    get edit_casestudy_url(@casestudy)
    assert_response :success
  end

  test "should update casestudy" do
    patch casestudy_url(@casestudy), params: { casestudy: { category_id: @casestudy.category_id, description: @casestudy.description, slug: @casestudy.slug, title: @casestudy.title, user_id: @casestudy.user_id } }
    assert_redirected_to casestudy_url(@casestudy)
  end

  test "should destroy casestudy" do
    assert_difference('Casestudy.count', -1) do
      delete casestudy_url(@casestudy)
    end

    assert_redirected_to casestudies_url
  end
end
