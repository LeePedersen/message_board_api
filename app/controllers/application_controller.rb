class ApplicationController < ActionController::API
  include Response
  # protect_from_forgery with: :exception
  # helper_method :current_user
  before_action :authenticate_request
  attr_reader :current_user

  # def current_user
  #   if session[:user_id]
  #     @current_user ||= User.find(session[:user_id])
  #   end
  # end

  # def authorize
  #   if !current_user
  #     # flash[:alert] = "You aren't authorized to visit that page."
  #     redirect_to '/'
  #   end
  # end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end
