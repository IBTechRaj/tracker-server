class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false
  # overriding create method of Knock::AuthTokenController module
  def create
    render json: {
      jwt: auth_token.token,
      user: User.find(auth_token.payload[:sub])
    }
  end
end
