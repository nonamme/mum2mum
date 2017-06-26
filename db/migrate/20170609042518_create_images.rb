class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :image_link
      t.text :image_description

      t.timestamps
    end
  end
end
