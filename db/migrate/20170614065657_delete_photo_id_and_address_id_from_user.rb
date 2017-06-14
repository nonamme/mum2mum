class DeletePhotoIdAndAddressIdFromUser < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :address_id, :string
    remove_column :users, :photo_id, :string
  end

  def down
    add_column :users, :photo_id, :string
    add_column :users, :address_id, :string
  end
end
