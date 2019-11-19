class LabelsController < ApplicationController
  before_action :set_params, only: [:edit, :destroy, :update]
  before_action :display_limit
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = current_user.labels.build(label_params)
    if @label.save
      redirect_to labels_path, notice: "ラベルを作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to labels_path, notice: "ラベルを更新しました"
    else
      redirect_to labels_path, notice: "ラベルを更新できません"
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_path, notice: "ラベルを削除しました。"
  end

  private

  def label_params
    params.require(:label).permit(:name, :created_at, :updated_at)
  end

  def set_params
    @label = Label.find(params[:id])
  end

  def display_limit
    redirect_to new_session_path unless logged_in?
  end
end
