class CreateSocials < ActiveRecord::Migration[5.1]
  def change
    create_table :socials do |t|
      t.string :facebook, default: "Not applicable"
      t.string :twitter, default: "Not applicable"
      t.string :instagram, default: "Not applicable"

      t.timestamps
    end
  end
end
