class AddFirmNameToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :firm_name, :string
  end
end
