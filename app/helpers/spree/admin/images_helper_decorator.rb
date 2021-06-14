module Spree
  module Admin
    module ImagesHelperDecorator
      def self.prepended(klass)
        klass.module_eval do
          def options_text_for image, product = nil
            image.variants.where(product: product).map { |variant|
              variant.sku_and_options_text.present? ?
                  variant.sku_and_options_text : Spree.t(:all) }.join('; ')
          end
        end
      end
    end
  end
end

Spree::Admin::ImagesHelper.prepend Spree::Admin::ImagesHelperDecorator if
  ::Spree::Admin::ImagesHelper.included_modules.exclude?(Spree::Admin::ImagesHelperDecorator)