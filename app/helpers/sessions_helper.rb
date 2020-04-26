module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  #ログイン中ユーザーを定義するメソッド

  def logged_in?
    !!current_user
  end
  #ログインしているのかどうか確認するメソッド
end
