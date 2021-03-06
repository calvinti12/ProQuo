module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  # Nil if not logged in.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_profile
    @current_user_path ||= profile_url username: current_user.username
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
