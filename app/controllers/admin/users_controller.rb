class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    # if current_user == @user && current_user.admin?
    #   redirect_to admin_users_path, notice: "管理者は管理者画面で自分のプロフィールを編集することは出来ません！"
    # end
  end


  def update
    unless @user.update(user_params)
      redirect_to admin_users_path, notice: "編集できません！"
    else
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を更新しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def destroy
    unless @user.destroy
      redirect_to admin_users_path, notice: "削除できません！"
    else
      redirect_to admin_users_path, notice: "ユーザーを削除しました"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to status: 404 unless current_user.admin?
  end


end
