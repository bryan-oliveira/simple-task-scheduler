class TaskLog < ApplicationRecord
  # Each task log belongs to a task
  belongs_to :task

  # Order all logs by execution date (descending)
  default_scope -> { order(execution_start_date: :desc) }

  # Task log validators
  validates :execution_status, presence: true
  validates :error_log, presence: true
  validates :task_id, presence: true
  validates :name, presence: true
  validates :execution_start_date, presence: true
  validates :execution_time, presence: true
end
