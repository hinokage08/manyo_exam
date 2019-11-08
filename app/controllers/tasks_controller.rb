class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search]
      @tasks = Task.task_name_search(params[:task_name]).status_search(params[:status]).page(params[:page]).per(3)
    elsif params[:sort_deadline]
      @tasks = Task.page(params[:page]).per(3).order(deadline: "DESC")
    elsif params[:sort_priority]
      @tasks = Task.page(params[:page]).per(3).order(priority: "ASC")
    else
      @tasks = Task.page(params[:page]).per(3).order(id: "DESC")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "タスクを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :content, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
