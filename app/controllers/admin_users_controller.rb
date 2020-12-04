class AdminUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def new
    @admin_user = AdminUser.new
  end
  def create
    @admin_user = AdminUser.new(admin_user_params)  # (params[:admin_user]) これは完璧でない実装だけど・・・
                                                    # paramsの:admin_userってどこで定義してる？？
    if @admin_user.save # 保存が成功したら
      admin_log_in @admin_user #helperから。 @admin_userは引数
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
  def edit
    @admin_user = AdminUser.find(params[:id])
  end
  
  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_user_params)
      flash[:success] = "プロフィールの更新に成功しました"
      redirect_to @admin_user
    else
      render 'edit'
    end
  end

  
  private

    def admin_user_params
      params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
      # 受け取る値はpernmitの値のみ、他の値は受け取らないようにする。
    end
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user # 2行目のアクション
      unless admin_logged_in? # admin_sessions_helperで定義
        flash[:danger] = "ログインしてください"
        redirect_to admin_login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @admin_user = AdminUser.find(params[:id])
      redirect_to(root_url) unless current_admin_user?(@admin_user)
    end
end
