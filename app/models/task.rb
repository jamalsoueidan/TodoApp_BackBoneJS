class Task < ActiveRecord::Base
  attr_accessible :body, :parent_id, :status, :done, :category_id, :sortable
  
  belongs_to :category
  
  def body
    self[:body].gsub(/\n\n/, " <br />")
  end
  
end
