class SessionsController < ApplicationController
  
  def new
  end

  def create 
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      # rcoffma1@gmail.com/foodaddy
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination' # not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
