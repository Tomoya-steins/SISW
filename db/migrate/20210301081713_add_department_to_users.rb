class AddDepartmentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :department, :string
    add_column :users, :birthplace, :string
  end
end
