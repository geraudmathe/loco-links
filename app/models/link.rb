class Link < ActiveRecord::Base
  attr_accessible :name, :url, :category_id
  belongs_to :category
end
