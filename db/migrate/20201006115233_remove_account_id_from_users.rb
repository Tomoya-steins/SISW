class RemoveAccountIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :account_id, :string
  end
end
