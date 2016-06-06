require_dependency "faalis/application_controller"

module Faalis::Shop
  class Shop::OrdersController < ::ApplicationController
    layout Engine.default_layout

    def index
      @orders = Order.find_by(user: current_user)
    end

    def basket
      @orders = Order.find_by(user: current_user, status: :ordered)
    end

  end
end
