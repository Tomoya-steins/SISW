class RemoveProfileFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile, :text
    remove_column :users, :profile_image_id, :string
  end
end
