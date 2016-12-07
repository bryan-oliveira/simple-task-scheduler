class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :authenticate_request

  attr_reader :current_user

  # Prints the API documentatoin for web service access
  def api_docs
    respond_to do |format|
      format.html { render file: 'shared/api_docs' }
      format.json { render 'shared/api_docs' }
    end
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers, params).result
    respond_to do |format|
      format.html { redirect_to signin_path unless @current_user }
      format.json { render json: { error: 'Not Authorized' }, status: 401 unless @current_user }
    end
  end

end
