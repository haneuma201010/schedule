class SchoolUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @school_users = SchoolUser.all
  end
  def new
    @school_user = SchoolUser.new
  end
  def create
    @school_user = SchoolUser.new(school_user_params)  # (params[:admin_user]) これは完璧でない実装だけど・・・
                                                    # paramsの:admin_userってどこで定義してる？？
    if @school_user.save # 保存が成功したら
      school_log_in @school_user #helperから。 @admin_userは引数
      flash[:success] = "ユーザー登録成功！！おめでとう！！"
      redirect_to @school_user
    else # 保存できないならnewに戻る
      render 'new'
    end
  end
  def home
  end
  def show
    @school_user = SchoolUser.find(params[:id])
  end
  def edit
    @school_user = SchoolUser.find(params[:id])
  end
  
  def update
    @school_user = SchoolUser.find(params[:id])
    if @school_user.update(school_user_params)
      flash[:success] = "教室情報の更新に成功しました"
      redirect_to @school_user
    else
      render 'edit'
    end
  end
  
  def destroy
    SchoolUser.find(params[:id]).destroy
    flash[:success] = "教室情報を削除しました"
    redirect_to root_url
  end

  
  private

    def school_user_params
      params.require(:school_user).permit(:name, :email, :password, :password_confirmation)
      # 受け取る値はpernmitの値のみ、他の値は受け取らないようにする。
    end
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user # 2行目のアクション
      unless school_logged_in? # admin_sessions_helperで定義
        flash[:danger] = "ログインしてください"
        redirect_to school_login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @school_user = SchoolUser.find(params[:id])
      redirect_to(root_url) unless current_school_user?(@school_user)
    end
end
