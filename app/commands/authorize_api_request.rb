class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {}, p)
    @headers = headers
    puts "====================================================="
    # @headers.each {|h| puts h}
    
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    # Return false if decoded token is invalid or User.find returns empty set
    # Otherwise return user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token

    # Return user, or add error message to errors and return nil
    @user || errors.add(:token, 'Invalid token') && nil
  end

  # Decodes authorization token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # Extract token from authorization header received in the
  # initialization of the class
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
