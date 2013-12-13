module Scroll
  class PageCell < Cell::Rails
    include CanCan::ControllerAdditions
    include ApplicationHelper
    helper ApplicationHelper
    append_view_path "app/views"

    def list args = {}
      @pages = Scroll::Page.with_translations(I18n.locale).activated.order(args.fetch(:order, 'scroll_pages.created_at ASC')).limit(args.fetch(:limit, 10))
      args[:view] ? (render view: args[:view]) : render unless @pages.empty?
    end
  end
end