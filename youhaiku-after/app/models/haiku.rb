class Haiku < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
