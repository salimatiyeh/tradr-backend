class Users::DeviseCustomFailure < Devise::FailureApp
  def respond
    http_auth
  end
end
