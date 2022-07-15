module ShopCarts
    class AddsController < ApplicationController
      def create
        product = find_product
        if product
            # create cart_item to current_cart using the product id founded
            # cart_item (ShopCartItem class) has turbo method to replace quantity in the view
            cart_item = current_cart.shop_cart_items.find_or_create_by(product_id: product.id)
            cart_item.quantity += 1
            cart_item.save
        end
      end

      private

      def find_product
        # find using friendly id, params[:product] contains the slug of the product
        Product.friendly.find(params[:product])
      rescue ActiveRecord::RecordNotFound # handle exception if product not found
        nil
      end
    end
end
