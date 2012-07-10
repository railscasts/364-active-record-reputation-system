class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name

  has_many :haikus
  has_many :haiku_votes

  def total_votes
    HaikuVote.joins(:haiku).where(haikus: {user_id: self.id}).sum('value')
  end

  def can_vote_for?(haiku)
    haiku_votes.build(value: 1, haiku: haiku).valid?
  end
end
