class AddDescriptionColumnToLinksTable < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :description, :string
  end
end
