class Task < ApplicationRecord
  has_many :task_logs

  validates :name, presence: true, length: { maximum: 50}
  validates :execution_path, presence: true
  validates :execution_server, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
