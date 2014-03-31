module Scroll
  class Page < ActiveRecord::Base
    translates :slug, :title, :html, :content_type, :md_file, :md_remote, :content
    validates :translations, presence: :true
    accepts_nested_attributes_for :translations, allow_destroy: true

    extend FriendlyId
    friendly_id :title, use: :slugged

    mount_uploader :image, Uppr::Image
    store_in_background :image

    scope :activated, ->{ where(active: true) }
  end
end