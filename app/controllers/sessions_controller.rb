class SessionsController < ApplicationController
  layout 'application'

  def new
  end

  def create
  	user = login(params[:login], params[:password], params[:remember_me])
  	if user
      log_in user
      flash[:info] = "ログインしました"
  		redirect_back_or_to user
  	else
  		flash[:danger] = 'ニックネーム・メールアドレス もしくはパスワードが間違っています'
      render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_url
    flash[:warning] = "ログアウトしました"
  end
end
