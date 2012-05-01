class Admin::ApplicationController < ActionController::Base
  layout "application"
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to links_url
  end

  protect_from_forgery

  before_filter :require_admin!
  
  def require_admin!
    raise CanCan::AccessDenied unless current_user.present? && current_user.admin?
  end


end
