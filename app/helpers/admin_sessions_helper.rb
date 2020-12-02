module AdminSessionsHelper

  def admin_log_in(admin_user) # なんかしらのデータを受け取る(この場合はadmin_user)
    session[:admin_user_id] = admin_user.id # [:admin_user_id]っていう名前をつけた
    # ()の中のadmin_userと4行目右辺のadmin_user.idは同じ
    # ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成される。プラウザを閉じた瞬間に有効期限が終了する
    # session変数
  end
  
  
  
end
