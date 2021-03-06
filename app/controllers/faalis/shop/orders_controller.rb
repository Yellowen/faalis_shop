require_dependency "faalis/application_controller"

module Faalis::Shop
  class OrdersController < ::ApplicationController
    layout Faalis::Shop::Engine.default_layout

    before_action :authenticate_user!

    def index
      @orders = Order.find_by(user: current_user)
    end

    def basket
      #@orders = Order.find_by(user: current_user, status: :ordered)
      @orders = session[:basket]
    end

    def new
      product = Product.find_by(id: params[:id])
      if !product.nil?
        session[:basket] = [] if session[:basket].nil?
        product_exists = session[:basket].any? {|item| item['id'] == product.id}
        if !product_exists
          product_hash = {}
          product_hash[:id] = product.id
          product_hash[:name] = product.name
          product_hash[:price] = product.price
          product_hash[:amount] = 1
          product_hash[:tax] = product.tax
          product_hash[:total] = product_hash[:amount] * product_hash[:price]

          session[:basket] = []
          session[:basket] << product_hash
        else
          session[:basket].each do |item|
            item['amount'] = item['amount']+1 if item['name']== product.name
          end
        end

        redirect_to basket_path
      else
        flash[:error] = s("The product not found!")
        redirect_to basket_path
      end
    end

    def destroy
      if params[:id]
        session[:basket].each { |item| session[:basket].delete(item) if item['id'] == params[:id]}
        redirect_to basket_path
      end
    end
  end
end
