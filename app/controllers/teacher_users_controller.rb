class TeacherUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @teacher_users = TeacherUser.all
  end
  def new
    @teacher_user = TeacherUser.new
  end
  def create
    @teacher_user = TeacherUser.new(teacher_user_params)  # (params[:admin_user]) これは完璧でない実装だけど・・・
                                                    # paramsの:admin_userってどこで定義してる？？
    if @teacher_user.save # 保存が成功したら
      teacher_log_in @teacher_user #helperから。 @admin_userは引数
      flash[:success] = "講師の登録が成功しました。"
      redirect_to @teacher_user
    else # 保存できないならnewに戻る
      render 'new'
    end
  end
  def home
  end
  def show
    @teacher_user = TeacherUser.find(params[:id])
  end
  def edit
    @teacher_user = TeacherUser.find(params[:id])
  end
  
  def update
    @teacher_user = TeacherUser.find(params[:id])
    if @teacher_user.update(teacher_user_params)
      flash[:success] = "講師情報の更新に成功しました"
      redirect_to @teacher_user
    else
      render 'edit'
    end
  end
  
  def destroy
    TeacherUser.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end

  
  private

    def teacher_user_params
      params.require(:teacher_user).permit(:name, :email, :password, :password_confirmation)
      # 受け取る値はpernmitの値のみ、他の値は受け取らないようにする。
    end
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user # 2行目のアクション
      unless teacher_logged_in? # admin_sessions_helperで定義
        flash[:danger] = "ログインしてください"
        redirect_to teacher_login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @teacher_user = TeacherUser.find(params[:id])
      redirect_to(root_url) unless current_teacher_user?(@teacher_user)
    end
end
