class AddReferenceToUser < ActiveRecord::Migration[5.0]
  def up
    add_reference :users, :address, foreign_key: true
    add_reference :addresses, :user, foreign_key: true
  end

  def down
    remove_reference :addresses, :user, foreign_key: true
    remove_reference :users, :address, foreign_key: true
  end
end
