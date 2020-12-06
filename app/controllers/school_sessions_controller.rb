class SchoolSessionsController < ApplicationController
  def new
  end
  def create
    school_user = SchoolUser.find_by(email: params[:session][:email].downcase) # AdminUserからemailのみで検索
    if school_user && school_user.authenticate(params[:session][:password]) 
      # admin_userがnilでないかつパスワードが一致した場合
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      school_log_in school_user
      redirect_to school_user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end
  
  def destroy
    school_log_out
    redirect_to root_url
  end
end
