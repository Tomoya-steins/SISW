class RemoveFinishedFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :finished, :boolean
  end
end
