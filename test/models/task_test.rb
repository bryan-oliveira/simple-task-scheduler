require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @task = tasks(:example_task)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "name should be present" do
    @task.name = "    "
    assert_not @task.valid?
  end

  test "name should not be too long" do
    @task.name = " " * 51
    assert_not @task.valid?
  end

  test "execution path should be present" do
    @task.execution_path = "    "
    assert_not @task.valid?
  end

  test "execution server should be present" do
    @task.execution_server = "    "
    assert_not @task.valid?
  end

  test "start date should be valid" do
    @task.start_date = nil
    assert_not @task.valid?
  end

  test "end date should be valid" do
    @task.end_date = "    "
    assert_not @task.valid?
  end

end
