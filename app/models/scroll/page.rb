module Scroll
  class Page < ActiveRecord::Base
    translates :slug, :title, :content
    validates :translations, presence: :true
    include Core::Concerns::Localizable

    extend FriendlyId
    friendly_id :title, use: :slugged

    mount_uploader :image, Uploadable::Image
    store_in_background :image

    scope :activated, ->{ where(active: true) }
  end
end