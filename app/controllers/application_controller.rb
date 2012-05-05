require "open-uri"
class ApplicationController < ActionController::Base


  protect_from_forgery

  before_filter :menu_chapter
  def menu_chapter
    @top_chapters = Category.all
    @link = Link.new
    @categories = Category.all.collect {|p| [ p.name, p.id ] }
  end



end
