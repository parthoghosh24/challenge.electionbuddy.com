class AddEntityToTails < ActiveRecord::Migration[6.0]
  def change
    add_column :trails, :entity, :string
  end
end
