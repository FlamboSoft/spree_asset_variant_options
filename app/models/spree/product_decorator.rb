# frozen_string_literal: true

module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :nonuniq_variant_images, -> { order(:position) }, source: :images, through: :variants_including_master

    end

    def variant_images
      variant_images = Spree::VariantImage.where(variant_id: variants_including_master_ids)
      Spree::Image.where(id: variant_images.pluck(:image_id), viewable_type: 'Spree::Variant').order(position: :asc)
    end
  end
end

::Spree::Product.prepend(Spree::ProductDecorator)
