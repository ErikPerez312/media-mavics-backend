class ApplicationController < ActionController::API
  # Prevent rails from encoding ampersand
  # config.active_support.escape_html_entities_in_json = false

  # 1. Import HttpAuthentication library from ActionController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # 2. Require authentication for all controller in our app
  before_action :require_login
  Stripe.api_key = "sk_test_0gnxbjwyeFfHIXOOymaLh3cz"

  # 3. This will be used/called when we need authentication
  def require_login
    authorize_request || render_unauthorized("YOU THOUGHT. Access denied boiiiiiiii")
  end

  # 4. Helper method to find the current_user in a request
  def current_user
    @current_user ||= authorize_request
  end

  # 5. Renders an message when a user is unauthorized
  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  private
  # 6. Authenticate a user with by token
  def authorize_request
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
