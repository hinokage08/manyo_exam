class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :basic_authentication, if: :production?

  private

  def production?
   Rails.env.production?
  end

  def basic_authentication
    authenticate_or_request_with_http_basic do |name, password|
      name == 'admin' && password == 'admin_password'
    end
  end

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  private
    def rescue403(e)
      @exception = e
      render template: 'errors/forbidden', status: 403
    end
end
