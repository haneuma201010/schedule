class StudentUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @student_users = StudentUser.all
  end
  def new
    @student_user = StudentUser.new
  end
  def create
    @student_user = StudentUser.new(student_user_params)  # (params[:admin_user]) これは完璧でない実装だけど・・・
                                                    # paramsの:admin_userってどこで定義してる？？
    if @student_user.save # 保存が成功したら
      student_log_in @student_user #helperから。 @admin_userは引数
      flash[:success] = "ユーザー登録成功！！おめでとう！！"
      redirect_to @student_user
    else # 保存できないならnewに戻る
      render 'new'
    end
  end
  def home
  end
  def show
    @student_user = StudentUser.find(params[:id])
  end
  def edit
    @student_user = StudentUser.find(params[:id])
  end
  
  def update
    @student_user = StudentUser.find(params[:id])
    if @student_user.update(student_user_params)
      flash[:success] = "生徒情報の更新に成功しました"
      redirect_to @student_user
    else
      render 'edit'
    end
  end
  
  def destroy
    StudentUser.find(params[:id]).destroy
    flash[:success] = "生徒情報を削除しました"
    redirect_to root_url
  end

  
  private

    def student_user_params
      params.require(:student_user).permit(:name, :email, :password, :password_confirmation)
      # 受け取る値はpernmitの値のみ、他の値は受け取らないようにする。
    end
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user # 2行目のアクション
      unless student_logged_in? # admin_sessions_helperで定義
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @student_user = StudentUser.find(params[:id])
      redirect_to(root_url) unless current_student_user?(@student_user)
    end
end
