class AddPlaceIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :place_id, :integer
  end
end
