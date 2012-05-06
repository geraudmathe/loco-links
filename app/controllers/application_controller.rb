require "open-uri"
class ApplicationController < ActionController::Base


  protect_from_forgery

  before_filter :menu_chapter
  def menu_chapter
    categories = Category.all
    @link = Link.new
    @categories = categories.collect {|p| [ p.name, p.id ] }
    optGgroup = categories
    @top_chapters = categories
  end



end
