class Category < ActiveRecord::Base
  attr_accessible :chapter, :name
  has_many :links

  def define_chapter
    self.clicks = 0
  end
end
