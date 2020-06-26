class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :original_attributes
      t.string :modified_attributes
      t.string :type
      t.string :action
      t.integer :user_id

      t.timestamps
    end
  end
end
