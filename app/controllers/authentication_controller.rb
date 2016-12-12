class AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      respond_to do |format|
        format.html { render html: command.result }
        format.json { render json: { auth_token: command.result } }
      end
    else
      respond_to do |format|
        format.html { render html: command.errors }
        format.html { render json: { error: command.errors }, status: :unauthorized }
      end
    end
  end

end
