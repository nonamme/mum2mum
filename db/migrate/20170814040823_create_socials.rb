class CreateSocials < ActiveRecord::Migration[5.1]
  def change
    create_table :socials do |t|
      t.string :facebook
      t.string :twitter
      t.string :instagram

      t.timestamps
    end
  end
end
