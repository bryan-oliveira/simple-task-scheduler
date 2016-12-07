require 'test_helper'

class UpdateTaskFlowTest < ActionDispatch::IntegrationTest

  def setup
    @task = tasks(:example_task)
    @invalid_task = tasks(:invalid_task)
  end

  test "successful edit with forwarding" do
    put update_task_url @task, params: { task: {id: 1}}
    assert_not flash[:success].empty?
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "unsuccessful edit" do
    put update_task_url @invalid_task, params: { task: {id: 1}}
    assert flash.empty?
    assert_response :success
    assert_template 'tasks/edit'
  end

end
