class TaskLogsController < ApplicationController
  before_action :authenticate_request
  
  def index
    @task_logs = TaskLog.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @task_logs, status: :ok }
    end
  end

end
