class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:name],
        params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid name/password combination."
      @title = "Sign in"
      render 'new'
    else
      if signed_in?
        sign_out      
      end
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to signin_path
  end


end
