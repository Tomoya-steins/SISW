class RemoveTablefromDirectMessage < ActiveRecord::Migration[6.0]
  def change
    drop_table :direct_messages
  end
end
