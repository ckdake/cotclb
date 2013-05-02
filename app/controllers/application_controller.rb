class ApplicationController < ActionController::Base
  include Pundit
  
  NoCurrentUser = Module.new
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_content_language_header
  before_action :authenticate_in_test_mode
  before_action :authenticate!
  
  private

  def set_content_language_header
    # Google Chrome had a tendency to detect pages as being in Dutch and
    # offering to translate them.
    response.headers['Content-Language'] = 'en-US'
  end

  def redirect_url_with_default(default)
    params[:redirect_to].presence || default
  end

  def authenticate_in_test_mode
    if Rails.env.test? && user_id = params.delete(:auth_user_id)
      self.current_user = User.find(user_id)
    end
  end

  def authenticate!
    current_user
  rescue NoCurrentUser
    flash[:return_to] = request.url
    redirect_to "/auth/google_apps"
  end

  def authenticated?
    current_user && true
  rescue NoCurrentUser
    false
  end
  helper_method :authenticated?

  def current_user
    @current_user ||= User.find(session[:user_id].to_s)
  rescue ActiveRecord::RecordNotFound => e
    e.extend(NoCurrentUser)
    raise
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
end
