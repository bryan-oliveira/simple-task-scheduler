module ApplicationHelper

  # Return string array with days of the week that equal true
  def get_days_to_execute_on(task)
    days = []
    if task.monday
      days.push('Monday')
    end
    if task.tuesday
      days.push('Tuesday')
    end
    if task.wednesday
      days.push('Wednesday')
    end
    if task.thursday
      days.push('Thursday')
    end
    if task.friday
      days.push('Friday')
    end
    if task.saturday
      days.push('Saturday')
    end
    if task.sunday
      days.push('Sunday')
    end
    return days
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Simple Task Scheduler"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
