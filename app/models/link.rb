class Link < ActiveRecord::Base
  attr_accessible :name, :url, :category_id, :language, :clicks
  belongs_to :category
  before_create :zero_clicks
  validates_presence_of :name, :url, :category_id
  validates_uniqueness_of :url
  scope :validated, where(:validated=>true)
  scope :unvalidated, where(:validated=>false)
  scope :waiting, where(:validated=>nil)
  def update_click
    self.clicks += 1
    self.save!
  end


  def zero_clicks
    self.clicks = 0
  end
end
