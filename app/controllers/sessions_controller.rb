class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path, notice: 'ログインしました'
    else
      flash.now[:notice] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
