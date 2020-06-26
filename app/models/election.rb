class Election < ApplicationRecord
  include ActiveModel::Serialization
  has_many :questions
  has_many :election_trails
  belongs_to :user
  after_create :create_election_trail
  before_update :create_updated_election_trail
  before_destroy :create_destroy_election_trail

  serialize :settings, Hash

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end

  def create_election_trail
      ElectionTrail.create!(user_id: User.current_user.id, 
                            election_id: self.id, 
                            modified_attributes: self.serializable_hash, 
                            action: "CREATED", 
                            entity: self.class.name)
  end

  def create_updated_election_trail
    ElectionTrail.create!(user_id: User.current_user.id, 
                          election_id: self.id, 
                          modified_attributes: self.changes, 
                          action: "UPDATED", 
                          entity: self.class.name)
end

def create_destroy_election_trail
  ElectionTrail.create!(user_id: User.current_user.id, 
                        election_id: self.id, 
                        modified_attributes: self.changes, 
                        action: "DESTROYED", 
                        entity: self.class.name)
end

end
