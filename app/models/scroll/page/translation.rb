module Scroll
  class Page::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    validates :title, length: { maximum: 255 }, presence: true
    validates :content_type, presence: true
    validates :locale, presence: true, uniqueness: { scope: :scroll_page_id }
    validates :slug, uniqueness: { scope: :locale }

    before_validation :set_slug

    enumerize :locale, in: I18n.available_locales
    enumerize :content_type, in: %w(file remote html)

    def to_s
      title
    end

    def content
      case content_type
      when 'html'
        html.html_safe
      end
    end

    private
      def set_slug
        self.slug = slug? ? slug.try(:parameterize) : to_s.try(:parameterize)
      end
  end
end