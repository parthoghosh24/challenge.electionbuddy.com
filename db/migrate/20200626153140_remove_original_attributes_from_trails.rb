class RemoveOriginalAttributesFromTrails < ActiveRecord::Migration[6.0]
  def change
    remove_column :trails, :original_attributes
  end
end
