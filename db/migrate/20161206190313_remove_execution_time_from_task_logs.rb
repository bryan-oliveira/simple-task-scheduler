class RemoveExecutionTimeFromTaskLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :task_logs, :execution_time, :datetime
    add_column :task_logs, :execution_time, :integer
  end
end
