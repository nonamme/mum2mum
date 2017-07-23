class CreateComments < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
