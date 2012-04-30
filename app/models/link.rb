class Link < ActiveRecord::Base
  attr_accessible :name, :url, :category_id, :language
  belongs_to :category
end
