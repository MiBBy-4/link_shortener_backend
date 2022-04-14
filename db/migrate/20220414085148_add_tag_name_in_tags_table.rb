class AddTagNameInTagsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :tag_name, :string
  end
end
