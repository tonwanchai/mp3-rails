require "test_helper"

class PlaylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
   @controller = PlaylistsController.new
  end

  test "should get index" do
    get playlist_url
    assert_response :success
  end

  test "should get new" do
    get new_playist_url
    assert_response :success
  end

  test "should create playlist" do
    assert_difference('Playlist.count') do
      post playlist_url, params: { playlist: { name: @playlist.name } }
    end

    assert_redirected_to playlist_url(Playlist.last)
  end

  test "should show playlist" do
    get playlist_url(@playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_playlist_url(@playlist)
    assert_response :success
  end

  test "should update playlist" do
    patch playlist_url(@playlist), params: { playlist: { name: @playlist.name } }
    assert_redirected_to playlist_url(@playlist)
  end

  test "should destroy playlist" do
    assert_difference('Playlist.count', -1) do
      delete playlist_url(@playlist)
    end

    assert_redirected_to playlist_url
  end
end
