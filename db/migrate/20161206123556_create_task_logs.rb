class CreateTaskLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :task_logs do |t|
      t.string :execution_status
      t.datetime :start_date
      t.datetime :end_date
      t.text :error_log
      t.datetime :execution_time
      t.references :task, foreign_key: true

      t.timestamps
    end
    add_index :task_logs, [:task_id, :created_at]
  end
end
