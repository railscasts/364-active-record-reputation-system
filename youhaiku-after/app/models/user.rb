class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name

  has_many :haikus
  has_many :evaluations, class_name: "RSEvaluation", as: :source
  
  has_reputation :votes, source: {reputation: :votes, of: :haikus}, aggregated_by: :sum
  
  def voted_for?(haiku)
    evaluations.where(target_type: haiku.class, target_id: haiku.id).present?
  end
end
