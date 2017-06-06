class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :post_code
      t.string :country

      t.timestamps
    end
  end
end
