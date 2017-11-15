require 'test_helper'

class Admin::WeekSchedulesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_week_schedules_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_week_schedules_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_week_schedules_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_week_schedules_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_week_schedules_controller_destroy_url
    assert_response :success
  end

  test "should get show" do
    get admin_week_schedules_controller_show_url
    assert_response :success
  end

end
