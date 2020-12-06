module SchoolSessionsHelper

  def school_log_in(school_user) # なんかしらのデータを受け取る(この場合はadmin_user)
    session[:school_user_id] = school_user.id # [:admin_user_id]っていう名前をつけた
    # ()の中のadmin_userと4行目右辺のadmin_user.idは同じ
    # ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成される。プラウザを閉じた瞬間に有効期限が終了する
    # session変数
  end
  
  # 現在ログイン中のユーザーを返す（いる場合）
  def current_school_user
    if session[:school_user_id]
      @current_school_user ||= SchoolUser.find_by(id: session[:school_user_id]) # @current_admin_user = @current_admin_user || AdminUser.find_by(id: admin_user_id)
                                                                             # @current_admin_userに値がなにもないときのみAdminUserに問い合わせる
      # インスタンス変数は値を保持するために使っている
    end
  end
  # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_school_user?(school_user)
    school_user && school_user == current_school_user
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def school_logged_in?
    !current_school_user.nil?
  end
  
  # 現在のユーザーをログアウトする
  def school_log_out
    session.delete(:school_user_id)
    @current_school_user = nil
  end
end
