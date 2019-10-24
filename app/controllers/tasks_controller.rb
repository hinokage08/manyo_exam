class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました"
    else
      render :new
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :content)
  end
end
