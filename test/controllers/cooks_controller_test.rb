require "test_helper"

class CooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cook = cooks(:one)
  end

  test "should get index" do
    get cooks_url, as: :json
    assert_response :success
  end

  test "should create cook" do
    assert_difference("Cook.count") do
      post cooks_url, params: { cook: { body: @cook.body, title: @cook.title } }, as: :json
    end

    assert_response :created
  end

  test "should show cook" do
    get cook_url(@cook), as: :json
    assert_response :success
  end

  test "should update cook" do
    patch cook_url(@cook), params: { cook: { body: @cook.body, title: @cook.title } }, as: :json
    assert_response :success
  end

  test "should destroy cook" do
    assert_difference("Cook.count", -1) do
      delete cook_url(@cook), as: :json
    end

    assert_response :no_content
  end
end
