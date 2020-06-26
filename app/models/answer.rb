class Answer < ApplicationRecord
  include ActiveModel::Serialization
  belongs_to :question
  after_create :create_election_trail
  before_update :create_updated_election_trail
  before_destroy :create_destroy_election_trail

  def create_election_trail
    ElectionTrail.create!(user_id: User.current_user.id, 
                          election_id: self.question.election.id, 
                          modified_attributes: self.serializable_hash, 
                          action: "CREATED", 
                          entity: self.class.name)
  end

  def create_updated_election_trail
    ElectionTrail.create!(user_id: User.current_user.id, 
                          election_id: self.question.election.id, 
                          modified_attributes: self.changes, 
                          action: "UPDATED", 
                          entity: self.class.name)
  end

  def create_destroy_election_trail
  ElectionTrail.create!(user_id: User.current_user.id, 
                        election_id: self.question.election.id, 
                        modified_attributes: self.changes, 
                        action: "DESTROYED", 
                        entity: self.class.name)
  end

  
end
