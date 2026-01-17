require "test_helper"

class CursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curse = curses(:one)
  end

  test "should get index" do
    get curses_url
    assert_response :success
  end

  test "should get new" do
    get new_curse_url
    assert_response :success
  end

  test "should create curse" do
    assert_difference("Curse.count") do
      post curses_url, params: { curse: { address: @curse.address, city: @curse.city, start_date: @curse.start_date, state: @curse.state, title: @curse.title } }
    end

    assert_redirected_to curse_url(Curse.last)
  end

  test "should show curse" do
    get curse_url(@curse)
    assert_response :success
  end

  test "should get edit" do
    get edit_curse_url(@curse)
    assert_response :success
  end

  test "should update curse" do
    patch curse_url(@curse), params: { curse: { address: @curse.address, city: @curse.city, start_date: @curse.start_date, state: @curse.state, title: @curse.title } }
    assert_redirected_to curse_url(@curse)
  end

  test "should destroy curse" do
    assert_difference("Curse.count", -1) do
      delete curse_url(@curse)
    end

    assert_redirected_to curses_url
  end
end
