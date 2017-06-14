class AddPasswordToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :password, :string
  end

  def down
    drop_column :users, :password, :string
  end
end
