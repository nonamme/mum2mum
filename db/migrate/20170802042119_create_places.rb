class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :city
      t.integer :local_no
      t.string :street

      t.timestamps
    end
  end
end
