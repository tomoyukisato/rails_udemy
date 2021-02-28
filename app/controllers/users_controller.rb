class UsersController < ApplicationController
  #ユーザ登録画面
  def new
    #インスタンス変数追加
    @user = User.new(flash[:user])
  end
  #ユーザ追加処理
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_back fallback_location: user,  flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
    
    # binding.pry
    
  end
  private 
  def user_params
    params.require(:user).permit(:name, :password, :password_digest)
  end
end
