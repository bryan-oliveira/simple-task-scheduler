require 'test_helper'

class TaskLogTest < ActiveSupport::TestCase

  def setup
    @task = tasks(:example_task)
    @task_log = task_logs(:example_task_log)
  end

  test "should be valid" do
    assert @task.valid?
    assert @task_log.valid?
  end

  test "execution status should be present" do
    @task_log.execution_status = nil
    assert_not @task_log.valid?
  end

  test "error log should be present" do
    @task_log.error_log = nil
    assert_not @task_log.valid?
  end

  test "task id should be present" do
    @task_log.task_id = nil
    assert_not @task_log.valid?
  end

  test "task log name log should be present" do
    @task_log.name = nil
    assert_not @task_log.valid?
  end

  test "execution start date should be present" do
    @task_log.execution_start_date = nil
    assert_not @task_log.valid?
  end

  test "execution time should be present" do
    @task_log.execution_time = nil
    assert_not @task_log.valid?
  end

end
