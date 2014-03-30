class ChangeContentToHtmlOnScrollPages < ActiveRecord::Migration
  def change
    rename_column :scroll_page_translations, :content, :html
  end
end
