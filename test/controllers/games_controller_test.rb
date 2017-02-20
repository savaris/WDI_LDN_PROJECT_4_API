require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { category: @game.category, cover_img: @game.cover_img, critic_rating: @game.critic_rating, description: @game.description, pegi_rating: @game.pegi_rating, screenshots: @game.screenshots, time_to_beat: @game.time_to_beat, title: @game.title, user_id: @game.user_id, video_url: @game.video_url } }, as: :json
    end

    assert_response 201
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { category: @game.category, cover_img: @game.cover_img, critic_rating: @game.critic_rating, description: @game.description, pegi_rating: @game.pegi_rating, screenshots: @game.screenshots, time_to_beat: @game.time_to_beat, title: @game.title, user_id: @game.user_id, video_url: @game.video_url } }, as: :json
    assert_response 200
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game), as: :json
    end

    assert_response 204
  end
end
