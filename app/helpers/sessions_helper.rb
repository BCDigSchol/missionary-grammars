module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user
    @current_user = user
  end

  def current_user
    session[:user_id]
  end

  def logged_in?
    ! current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def require_login
    unless logged_in?
      redirect_to controller: "texts", action: 'index'
    end
  end

end