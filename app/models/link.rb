class Link < ActiveRecord::Base
  attr_accessible :name, :url, :category_id, :language, :clicks
  belongs_to :category
  before_create :zero_clicks
  def update_click
    self.clicks += 1
    self.save!
  end

  def zero_clicks
    self.clicks = 0
  end
end
