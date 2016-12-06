class TasksController < ApplicationController
  respond_to :html, :json

  # Curl JSON example:
  # curl -i -H "Accept: application/json" -H "Content-Type: application/json" localhost:3000/api/v1/tasks

  def index
    @tasks = Task.all
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
    Task.find(params[:id]).destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Task deleted successfully"
        redirect_to tasks_url }
      format.json {}
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
      format.html {
        @task = Task.find(params[:id])
        # update_attributes performs attribute validation
        if @task.update_attributes(task_params)
          flash[:success] = "Task updated"
          redirect_to @task
        else
          render 'edit'
        end }
      format.json { render json: "TODO" }
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
