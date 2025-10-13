class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:user][:uid])
    @user.set_password(params[:user][:password])  # ← 暗号化して保存

    if @user.save
      redirect_to top_main_path, notice: "ユーザー登録が完了しました。"
    else
      render :new, status: 422
    end
  end
end
