# frozen_string_literal: true

module Spree
  module ImageDecorator
    def self.prepended(base)

      base.validate :has_variants
      base.attr_accessor :viewable_ids

      base.has_many :variant_images, class_name: '::Spree::VariantImage'
      base.has_many :variants, through: :variant_images

    end

    def variant_html_classes
      variant_ids.map { |variant| "tmb-#{variant}" }.join(" ")
    end
    
    def has_variants
      unless self.variants.any?
        errors.add(:base, :must_have_variants)
      end
    end

  end
end


::Spree::Image.prepend(Spree::ImageDecorator)
