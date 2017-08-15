class AddPostCodeAndLinkAndOpeningHoursToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :post_code, :string
    add_column :places, :link, :string
    add_column :places, :open_hours, :string
  end
end
