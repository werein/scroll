class CreateScrollPages < ActiveRecord::Migration
  def change
    create_table :scroll_pages do |t|
      t.boolean :active
      t.string :image
      t.string :image_tmp

      t.timestamps
    end
  end
end
