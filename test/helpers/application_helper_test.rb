require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  # Test full_title helper
  test "full title helper" do
    assert_equal full_title,         "Simple Task Scheduler"
    assert_equal full_title("Task"), "Task | Simple Task Scheduler"
  end

end
