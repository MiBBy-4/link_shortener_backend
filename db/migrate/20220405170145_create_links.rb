class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :base_link
      t.string :shorted_link
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
