class TasksController < ApplicationController
	 def new
    @task = Task.new
  end

  def edit
    @task =Task.find(params[:id])
  end
  def show
  	@task = Task.find(params[:id])
  end

  def create
  	 @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :action => 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(params[:task])
      redirect_to @task
    else
      render :action => 'edit'
    end
  end
  private
   def task_params
      params.require(:task).permit(:name, :project_id)

   end
end
