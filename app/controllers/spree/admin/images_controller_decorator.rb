module Spree
  module Admin
    module ImagesControllerDecorator
      def self.prepended(base)
        base.before_action :set_variants, only: [:create, :update]
      end
      
      private
    
        def set_variants
          @image.variant_ids = viewable_ids
        end
    
        def viewable_ids
          params[:image][:viewable_ids].reject(&:blank?)
        end
    end
  end
end

Spree::Admin::ImagesController.prepend Spree::Admin::ImagesControllerDecorator if
  ::Spree::Admin::ImagesController.included_modules.exclude?(Spree::Admin::ImagesControllerDecorator)