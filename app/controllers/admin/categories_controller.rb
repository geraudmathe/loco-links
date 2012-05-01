class Admin::CategoriesController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @chapters = Category.where(:chapter => 0)
  end
end