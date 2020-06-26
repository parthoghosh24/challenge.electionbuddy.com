class AddElectionIdToTrails < ActiveRecord::Migration[6.0]
  def change
    add_column :trails, :election_id, :integer
  end
end
