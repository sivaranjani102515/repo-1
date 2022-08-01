class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def current_cart
        cart = ShopCart.find_or_create_by( user_id: current_user.id, status: 'created')
        cookies[:cart_token] ||= cart.token
        cart
    end 
    helper_method :current_cart   
end
                    