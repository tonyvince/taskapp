class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    head :forbidden unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
