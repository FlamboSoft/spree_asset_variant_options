Spree::Variant.class_eval do
  has_many :variant_images, class_name: '::Spree::VariantImage'
  has_many :images_for_variant, through: :variant_images, source: :image

  def images
    images_for_variant
  end
end