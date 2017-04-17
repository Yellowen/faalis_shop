require_dependency "faalis/application_controller"

module Faalis::Shop
  class ProductsController < ::ApplicationController
    layout Faalis::Shop::Engine.default_layout

    def index
      # TODO: check members only
      @categories = Category.where(lock: false)

      if params[:category_id]
        @products = Product.where(lock: false, category_id: params[:category_id])
      else
        @products = Product.where(lock: false)
      end
    end

    def show
      @categories = Category.where(lock: false)
      @product = Product.find_by(permalink: params[:permalink])
      @category = @product.category
      @last_products = Product.last(3)
      @special_offers = Product.where.not(special_price: nil).last(3)
      @same_products = @category.products.last(4)
      @last_products = Product.where(lock: false).last(3)
    end
  end
end
