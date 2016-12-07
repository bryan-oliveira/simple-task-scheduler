require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @task = tasks(:example_task)
  end
=begin
  test "tasks page should have correct title" do
    get tasks_path
    assert_select "title", full_title("All Tasks")
  end

  test "task log page should have correct title" do
    get task_logs_path
    assert_select "title", full_title("All Task Logs")
  end

  test "new task page should have correct title" do
    get new_task_path
    assert_select "title", full_title("New Task")
  end

  test "edit task page should have correct title" do
    get edit_task_path @task
    assert_select "title", full_title("Edit Task")
  end

  test "task page title should be task name" do
    get task_path @task
    assert_select "title", full_title(@task.name)
  end
=end
end
