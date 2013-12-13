class CreateScrollPageTranslations < ActiveRecord::Migration
  def change
    create_table :scroll_page_translations do |t|
      t.references :scroll_page, index: true
      t.string :title
      t.string :locale
      t.string :slug
      t.text :content

      t.timestamps
    end
    add_index :scroll_page_translations, :locale
    add_index :scroll_page_translations, :slug
  end
end