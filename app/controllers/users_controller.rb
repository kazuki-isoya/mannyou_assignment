class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #ユーザー作成時にログインもする
      redirect_to tasks_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: '他のユーザーのプロフィールは編集できません！'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to tasks_path, notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: '他のユーザーのプロフィール詳細は見られません！'
    end
  end

  private


  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

end
