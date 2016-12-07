class TasksController < ApplicationController
  before_action :authenticate_request
  respond_to :html, :json

  # Curl JSON example:
  # curl -i -H "Accept: application/json" -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0ODExNjExMzB9.-QSQ4q904pJmRwhZj7Lf4ud6bwQVFzFBkPz8pzkdKCw" localhost:3000/api/v1/tasks
# "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0ODExNjExMzB9.-QSQ4q904pJmRwhZj7Lf4ud6bwQVFzFBkPz8pzkdKCw"

  #-H "Content-Type: application/json"

  def index
    @tasks = Task.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @tasks, status: :ok }
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @task, status: :ok }
    end
  end

  def destroy
    respond_to do |format|
      @task = Task.find(params[:id])

      if @task.destroy
        format.html { flash[:success] = "Task deleted successfully"
                      redirect_to tasks_url }
        format.json { render json: "Task deleted successfully", status: :ok }
      else
        format.html { redirect_to tasks_path }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @task = Task.new(task_params)
    puts task_params
    respond_to do |format|
      format.html {
        if @task.save
          flash[:info] = "Task created"
          redirect_to tasks_path
        else
          render 'new'
        end }

      format.json {  }
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.json {}
    end
  end

  def update
    respond_to do |format|
      @task = Task.find(params[:id])
      # update_attributes performs attribute validation
      if @task.update_attributes(task_params)
        format.html { flash[:success] = "Task updated"
                      redirect_to @task }
        format.json { render json: "Task updated", status: :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Restrict fields that can be updated to name, execution path/server, and dates/times
    def task_params
      params.require(:task).permit(:name, :execution_path, :execution_server,
                                   :start_date, :end_date,:sunday, :monday, :tuesday,
                                   :wednesday, :thursday, :friday, :saturday)
    end

end
