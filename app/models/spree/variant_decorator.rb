# frozen_string_literal: true

module Spree
  module VariantDecorator
    def self.prepended(base)
      base.has_many :variant_images, class_name: '::Spree::VariantImage'
      base.has_many :images_for_variant, through: :variant_images, source: :image
      base.has_many :images, -> { order(:position) }, as: :viewable

    end

    def images
      images_for_variant
    end
  end
end


::Spree::Variant.prepend(Spree::VariantDecorator)
