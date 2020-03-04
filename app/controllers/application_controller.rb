class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

  def current_user #ログイン中のユーザー情報をインスタンス変数として持たせる
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required #ログインしていなければログイン画面に飛ばせるメソッド
    redirect_to login_path unless current_user
  end
end
