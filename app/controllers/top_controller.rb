class TopController < ApplicationController
  def main
    if session[:login_uid].present?
      # ログイン中：ログイン成功ページ（main.html.erb）を表示
      render "main"
    else
      # 未ログイン：ログインフォーム（login.html.erb）を表示
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])

    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      # ログイン成功したら main にリダイレクト
      redirect_to action: "main"
    else
      render "error", status: 422
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to action: "main"
  end
end
