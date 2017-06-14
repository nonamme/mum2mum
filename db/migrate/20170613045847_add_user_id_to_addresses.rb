class AddUserIdToAddresses < ActiveRecord::Migration[5.0]
  def up
    add_column :addresses, :user_id, :integer
  end

  def down
    drop_column :addresses, :user_id, :integer
  end
end
