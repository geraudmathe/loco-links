class Link < ActiveRecord::Base
  attr_accessible :name, :url, :category_id, :language, :clicks, :user_id
  belongs_to :category
  belongs_to :user
  before_create :zero_clicks
  validates_presence_of :name, :url, :category_id, :user_id
  
  def update_click
    self.clicks += 1
    self.save!
  end


  def zero_clicks
    self.clicks = 0
  end
end
