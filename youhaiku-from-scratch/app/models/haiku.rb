class Haiku < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :haiku_votes

  def self.by_votes
    select('haikus.*, coalesce(value, 0) as votes').
    joins('left join haiku_votes on haiku_id=haikus.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || haiku_votes.sum(:value)
  end
end
