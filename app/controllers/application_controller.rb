class ApplicationController < ActionController::Base
  include Pagy::Backend

  private

  def current_account
    rodauth.rails_account
  end
  helper_method :current_account

  def authenticate
    rodauth.require_account # redirect to login page if not authenticated
  end
end
