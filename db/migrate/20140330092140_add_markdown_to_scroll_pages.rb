class AddMarkdownToScrollPages < ActiveRecord::Migration
  def change
    add_column :scroll_page_translations, :md_file, :string
    add_column :scroll_page_translations, :md_file_tmp, :string
    add_column :scroll_page_translations, :md_remote, :string
    add_column :scroll_page_translations, :content_type, :string
  end
end