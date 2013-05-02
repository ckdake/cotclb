class Signin
  attr_accessor :on_success, :on_failure

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def call
    user = User.find_or_initialize_by(email: @auth_hash[:info][:email])
    user.first_name = @auth_hash[:info][:first_name]
    user.last_name  = @auth_hash[:info][:last_name]
    user.nick_name  = @auth_hash[:info][:nickname]
    user.uid        = @auth_hash[:uid]
    user.save!

    raise Pundit::NotAuthorizedError unless user.active?

    on_success.call(user) if on_success
  rescue
    on_failure.call($!) if on_failure
  end
end
