class AddDescriptionToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :description, :text
  end
end
