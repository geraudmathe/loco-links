class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :menu_chapter
  def menu_chapter
    @top_chapters = Category.all
  end
end
