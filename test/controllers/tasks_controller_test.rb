require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @task = tasks(:example_task)
  end
=begin
  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should get show" do
    get task_url @task
    assert_response :success
  end

  test "should get destroy" do
    get destroy_task_url @task
    assert_response :success
  end

  test "should get create" do
    get create_task_url
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url @task
    assert_response :success
  end
=end

end
