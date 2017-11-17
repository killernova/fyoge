require 'test_helper'

class Admin::SeasonsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_seasons_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_seasons_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_seasons_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_seasons_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_seasons_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_seasons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_seasons_destroy_url
    assert_response :success
  end

end
