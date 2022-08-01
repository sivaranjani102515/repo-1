class WebhookController < ApplicationController
    protect_from_forgery except: :receive
    skip_before_action :authenticate_user!

    def receive
      event_sting = request.body.read
      
      event = Stripe::Event.construct_from(
        JSON.parse(event_sting, symbolize_names: true),
        )
        if event.type.include?('payment_intent')
            payment = event.data.object
            shop_cart = ShopCart.find_by(stripe_payment_id: payment.id)
            shop_cart.update(status: payment.status)
        end        
    end

end