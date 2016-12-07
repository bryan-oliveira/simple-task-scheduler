class RemoveDatesFromTaskLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :task_logs, :start_date, :datetime
    remove_column :task_logs, :end_date, :datetime
    add_column :task_logs, :execution_start_date, :datetime
  end
end
