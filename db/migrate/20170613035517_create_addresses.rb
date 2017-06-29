class CreateAddresses < ActiveRecord::Migration[5.0]
  def up
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.integer :home_number
      t.string :post_code
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :addresses, :users

    add_index :addresses, :user_id
    add_index :addresses, :id
  end

  def down
    drop_table :addresses
  end
end
