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

      t.timestamps
    end
  end

  def down
    drop_table :addresses
  end
end
