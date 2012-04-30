class Admin::ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_user
  

  def require_user
    redirect_to root_path unless current_user
  end
end
