class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end

    add_foreign_key :users, :addresses
    add_index :users, :id
  end

  def down
    drop_table :users
  end
end
