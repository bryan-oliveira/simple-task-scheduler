class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    respond_to do |format|
      format.html { redirect_to '/authentication' unless @current_user }
      format.json { render json: { error: 'Not Authorized' }, status: 401 unless @current_user }
    end
  end

end
