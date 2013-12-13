require_dependency "scroll/application_controller"

module Scroll
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:index, :new, :edit]
    load_and_authorize_resource
    respond_to :html, :json

    def index
      @pages = Page.with_translations(I18n.locale).includes(:translations).activated
      respond_with @pages
    end

    def show
      set_meta_tags title:        @page.title,
                    description:  @page.content,
                    keywords:     @page.title
      respond_with @page
    end

    def new
      @page = Page.new
      @page.translations.build
      respond_with @page
    end

    def edit
    end

    def create
      @page = Page.new(page_params)
      flash[:notice] = t(:'notice.success.scroll.page.create') if @page.save
      respond_with @page
    end

    def update
      flash[:notice] = t(:'notice.success.scroll.page.update') if @page.update(page_params)
      respond_with @page
    end

    def destroy
      redirect_to pages_path, notice: t(:'notice.success.scroll.page.destroy') if @page.destroy
    end

    private
      def set_page
        @page = Page.friendly.find(params[:id])
      end

      def set_title
        set_meta_tags title: t('.title')
      end

      def page_params
        params.require(:page).permit(:active, :image, translations_attributes: [:id, :title, :slug, :locale, :content, :_destroy]) if params[:page]
      end
  end
end