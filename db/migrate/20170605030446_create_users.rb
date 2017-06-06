class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :addres
      t.string :photo_link

      t.timestamps
    end
  end
end
