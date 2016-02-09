class SessionsController < ApplicationController
  def new
  end

  def create
    valid_users = ['florinb', 'calhound']

    if valid_users.include?(params[:session][:login].downcase) && params[:session][:password] == 'gr4mm4rs'
      log_in params[:session][:login]
      redirect_to controller: 'texts', action: 'index'
    else
      flash[:danger] = 'Invalid login/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to controller: 'texts', action: 'index'
  end
end
