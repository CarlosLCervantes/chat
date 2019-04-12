class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: :json_request

  private

  def json_request
    request.format.json?
  end
end
