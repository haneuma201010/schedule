class AdminSessionsController < ApplicationController
  def new
  end
  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase) # AdminUserからemailのみで検索
    if admin_user && admin_user.authenticate(params[:session][:password]) 
      # admin_userがnilでないかつパスワードが一致した場合
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      admin_log_in admin_user
      redirect_to admin_user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end
  
  def destroy
    admin_log_out
    redirect_to root_url
  end
end
