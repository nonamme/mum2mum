class AddReferenceToSocials < ActiveRecord::Migration[5.1]
  def change
    add_column :socials, :user_id, :integer
  end
end
