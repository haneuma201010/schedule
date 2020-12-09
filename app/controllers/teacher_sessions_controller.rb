class TeacherSessionsController < ApplicationController
  def new
  end
  def create
    teacher_user = TeacherUser.find_by(email: params[:session][:email].downcase) # AdminUserからemailのみで検索
    if teacher_user && teacher_user.authenticate(params[:session][:password]) 
      # admin_userがnilでないかつパスワードが一致した場合
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      teacher_log_in teacher_user
      redirect_to teacher_user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end
  
  def destroy
    teacher_log_out
    redirect_to root_url
  end
end
