class Admin::LinksController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @valid_links = Link.validated
    @invalid_links = Link.unvalidated
    @waiting_links = Link.waiting
  end

  def validate
    @link = Link.find(params[:id])
    @link.validated = true
    @link.save!
    redirect_to admin_links_path
  end

  def unvalidate
    @link = Link.find(params[:id])
    @link.validated = false
    @link.save!
    redirect_to admin_links_path
  end
end