class Admin::LinksController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @links = Link.all
  end
end