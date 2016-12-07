class Task < ApplicationRecord
  # Relationship 1 to many
  has_many :task_logs

  # Mandatory task atrributes
  validates :name, presence: true, length: { maximum: 50}
  validates :execution_path, presence: true
  validates :execution_server, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
