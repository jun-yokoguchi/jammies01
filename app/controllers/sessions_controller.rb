class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login(params[:login], params[:password], params[:remember_me])
  	if user
      flash[:info] = "ログインしました"
  		redirect_back_or_to user
  	else
  		flash[:danger] = 'Email or password was invalid.'
      render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_url
    flash[:warning] = "ログアウトしました"
  end
end
