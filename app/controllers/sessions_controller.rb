class SessionsController < ApplicationController
  layout false

  # OmniAuth does not send along a CSRF token
  skip_before_action :verify_authenticity_token, only: [:create, :signin_failed]
  skip_before_action :authenticate!, only: [:create, :signin_failed]

  def create
    Signin.new(auth_hash).tap { |command|
      command.on_success = method(:signin_success)
      command.on_failure = method(:signin_failure)
    }.call
  end

  def destroy
    reset_session
    render layout: 'unauthenticated'
  end

  def signin_failed
    @message = params[:message]
  end

  private

  def signin_success(user)
    self.current_user = user
    redirect_to flash[:return_to] || root_url
  end

  def signin_failure(error)
    @message = error.message
    render action: "signin_failed"
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
