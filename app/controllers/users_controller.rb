class UsersController < ApplicationController
  before_action :dont_user_new, only: [:new]
  before_action :check_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to tasks_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def dont_user_new
    redirect_to tasks_path if logged_in?
  end

  def check_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to tasks_path,notice:"権限がありません"
    end
  end

end
