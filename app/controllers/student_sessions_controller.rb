class StudentSessionsController < ApplicationController
  def new
  end
  def create
    student_user = StudentUser.find_by(email: params[:session][:email].downcase) # AdminUserからemailのみで検索
    if student_user && student_user.authenticate(params[:session][:password]) 
      # admin_userがnilでないかつパスワードが一致した場合
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      student_log_in student_user
      redirect_to student_user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが一致しません'
      render 'new'
    end
  end
  
  def destroy
    student_log_out
    redirect_to root_url
  end
end
