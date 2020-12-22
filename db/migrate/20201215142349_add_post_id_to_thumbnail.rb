class AddPostIdToThumbnail < ActiveRecord::Migration[6.0]
  def change
    add_column :thumbnails, :post_id, :integer
  end
end
