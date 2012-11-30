class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, :order => 'sortable ASC'
end
