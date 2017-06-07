class CreateNewsletters < ActiveRecord::Migration[5.0]
  def up
    create_table :newsletters do |t|
      t.string :email

      t.timestamps
    end
  end

  def down
    drop_table :newsletters
  end
end
