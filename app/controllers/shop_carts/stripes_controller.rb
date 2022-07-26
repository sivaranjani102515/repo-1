module ShopCarts
    class StripesController < ApplicationController

        def create
            #debugger
            shop_cart = ShopCart.find(params[:shop_cart_id])
            prices = shop_cart.shop_cart_items.map do |item|
             {price: item.product.stripe_price_id, quantity: item.quantity, description: item.product.name}
            end
            
            session = Stripe::Checkout::Session.create({
                cancel_url: checkout_url,
                success_url: root_url,
                mode: 'payment',
                payment_method_types: ['card'],
                line_items: prices
            })
            redirect_to session.url, allow_other_host: true
        end 
    end
end
