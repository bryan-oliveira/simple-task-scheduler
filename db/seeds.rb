# Generate fake error messages to populate db
error_msgs = ["Failed to initialize database.", "Insufficient system memory.", "Queue exceeded maximum length. Task rescheduled.", "User permission error.", "Outdated process version. Please upgrade system.", "Failed to compile.", "ERROR_TOO_MANY_OPEN_FILES", "0x13 ERROR_WRITE_PROTECT", "22 (0x16) ERROR_BAD_COMMAND"]

50.times do |n|

  # TASK
  # Generate task name, and start/end dates
  task_id = [*(0..9)].shuffle[0,6].join
  task_name = "Task #{task_id}"
  start_date = rand(300).days.ago
  end_date = rand(300).days.from_now

  # Generate random days to execute task on
  monday = [true,false].sample
  tuesday = [true,false].sample
  wednesday = [true,false].sample
  thursday = [true,false].sample
  friday = [true,false].sample
  saturday = [true,false].sample
  sunday = [true,false].sample

  # Generate random path and server names
  n = rand(0..9)
  execution_path = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  execution_server = "server#{n}"

  task = Task.create( name: task_name,
                      execution_path: execution_path,
                      execution_server: execution_server,
                      start_date: start_date,
                      end_date: end_date,
                      monday: monday,
                      tuesday: tuesday,
                      wednesday: wednesday,
                      thursday: thursday,
                      friday: friday,
                      saturday: saturday,
                      sunday: sunday)

  # TASK LOG
  7.times do |k|
    # Generate random task_log name
    task_log_id = [*(0..9)].shuffle[0,5].join
    task_log_name = "#{task_name}-#{task_log_id}"

    # Generate execution date
    execution_start_date = start_date + rand(10).days

    # Generate execution status
    execution_status = ['Success','Fail'].sample

    # Select random error message if execution status = Fail
    execution_status == 'Fail' ? error_log = error_msgs.sample : error_log = "No errors."

    # Generate execution time in HH:MM:SS format
    execution_time = Time.at(rand(1000)).utc.strftime("%H:%M:%S")

    task.task_logs.create(name: task_log_name,
                          execution_status: execution_status,
                          execution_start_date: execution_start_date,
                          error_log: error_log,
                          task_id: "#{n}")
  end

end
