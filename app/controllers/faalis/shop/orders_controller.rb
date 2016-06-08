require_dependency "faalis/application_controller"

module Faalis::Shop
  class OrdersController < ::ApplicationController

    def index
      @orders = Order.find_by(user: current_user)
    end

    def basket
      #@orders = Order.find_by(user: current_user, status: :ordered)
      @orders = Order.last
    end

  end
end
