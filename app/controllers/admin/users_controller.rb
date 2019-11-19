class Admin::UsersController < ApplicationController
  #before_action :check_admin
  def index
    @users = User.select(:id, :name, :email, :admin, :created_at, :updated_at).page(params[:page]).per(5).order(id: "ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を更新できません。"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
      flash[:notice] = "ユーザー「#{@user.name}」を削除しました。"
    else
      redirect_to admin_users_path
      flash[:notice] = "ユーザーを削除できません"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end


  def check_admin
    raise Forbidden unless logged_in? && current_user.admin?
  end

end
