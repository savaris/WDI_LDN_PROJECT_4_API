require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test "should get index" do
    get libraries_url, as: :json
    assert_response :success
  end

  test "should create library" do
    assert_difference('Library.count') do
      post libraries_url, params: { library: { game_id: @library.game_id, owned: @library.owned, played: @library.played, user_id: @library.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show library" do
    get library_url(@library), as: :json
    assert_response :success
  end

  test "should update library" do
    patch library_url(@library), params: { library: { game_id: @library.game_id, owned: @library.owned, played: @library.played, user_id: @library.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy library" do
    assert_difference('Library.count', -1) do
      delete library_url(@library), as: :json
    end

    assert_response 204
  end
end
