class Category < ActiveRecord::Base
  attr_accessible :chapter, :name
  has_many :links
end
