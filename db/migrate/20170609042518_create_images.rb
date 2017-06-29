class CreateImages < ActiveRecord::Migration[5.0]
  def up
    create_table :images do |t|
      t.integer :user_id
      t.string :image_link
      t.text :image_description

      t.timestamps
    end

    add_foreign_key :images, :users
    add_index :images, :id
    add_index :images, :user_id
  end

  def down
    drop_table :images
  end
end
