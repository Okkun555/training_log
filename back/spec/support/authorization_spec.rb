module AuthorizationHelper
  def sign_in(user)
    post '/api/v1/auth/sign_in',
      params: { email: user.email, password: user.password },
      headers: { 'Host' => 'localhost' }

      response.headers.slice('client', 'uid', 'token-type', 'access-token').merge('Host' => 'localhost')
  end
end