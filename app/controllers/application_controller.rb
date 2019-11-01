class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :basic_authentication

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && password == "admin_password"
=======
  before_action :basic_authentication, if: :production?

  private

  def production?
   Rails.env.production?
 end

  def basic_authentication
    authenticate_or_request_with_http_basic do |name, password|
      name == 'admin' && password == 'admin_password'
>>>>>>> 043ba15ce60d98de31042d60bfac4ac108ab3354
    end
  end
end
