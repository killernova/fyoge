require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get week" do
    get schedules_week_url
    assert_response :success
  end

  test "should get day" do
    get schedules_day_url
    assert_response :success
  end

end
