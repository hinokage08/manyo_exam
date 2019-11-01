class ApplicationController < ActionController::Base
  before_action :basic_authentication

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && password == "admin_password"
    end
  end
end
