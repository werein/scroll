RailsAdmin.config do |config|
  
  config.model Scroll::Page do
    navigation_icon 'icon-list-alt'
    field :active
    field :image
    field :translations
    list do
      field :title
      field :image
      field :created_at do
        column_width 200
      end
    end
  end
  
  config.model Scroll::Page::Translation do
    visible false
    field :title
    field :slug
    field :locale
    field :content, :ck_editor
  end
end if defined? RailsAdmin