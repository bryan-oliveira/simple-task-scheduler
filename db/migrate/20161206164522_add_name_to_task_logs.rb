class AddNameToTaskLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :task_logs, :name, :string
  end
end
