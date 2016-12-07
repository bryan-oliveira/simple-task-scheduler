require 'test_helper'

class TaskLogsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get task_logs_url
    assert_response :success
  end

end
