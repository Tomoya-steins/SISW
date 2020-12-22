class Thumbnail < ActiveRecord::Migration[6.0]
  def change
    drop_table :thumbnails
  end
end
