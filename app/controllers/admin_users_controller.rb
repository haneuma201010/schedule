class AdminUsersController < ApplicationController
  def new
    @admin_user = AdminUser.new
  end
  def create
    @admin_user = AdminUser.new(admin_user_params)  # (params[:admin_user]) これは完璧でない実装だけど・・・
                                                    # paramsの:admin_userってどこで定義してる？？
    if @admin_user.save # 保存が成功したら
      admin_log_in @admin_user
      flash[:success] = "ユーザー登録成功！！おめでとう！！"
      redirect_to @admin_user
    else # 保存できないならnewに戻る
      render 'new'
    end
  end
  def home
  end
  def show
    @admin_user = AdminUser.find(params[:id])
  end
  
  private

    def admin_user_params
      params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
      # 受け取る値はpernmitの値のみ、他の値は受け取らないようにする。
    end


end
