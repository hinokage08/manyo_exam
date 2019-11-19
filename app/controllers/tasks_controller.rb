class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :display_limit

  PER = 10

  def index
    if params[:search]
      @tasks = current_user.tasks.name_search(params[:task_name])
                           .status_search(params[:status])
                           .label_search(params[:label_id])
                           .page(params[:page]).per(PER)
    elsif params[:sort_deadline]
      @tasks = current_user.tasks.page(params[:page]).per(PER).order(deadline: "DESC")
    elsif params[:sort_priority]
      @tasks = current_user.tasks.page(params[:page]).per(PER).order(priority: "ASC")
    else
      @tasks = current_user.tasks.page(params[:page]).per(PER).order(id: "DESC")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    params.require(:task).permit(:task_name, :content, :deadline, :status, :priority, label_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def display_limit
    redirect_to new_session_path unless logged_in?
  end

end
