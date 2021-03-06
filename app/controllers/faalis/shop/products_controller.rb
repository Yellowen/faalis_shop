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
      @product = Product.find_by(permalink: params[:permalink], lock: false)
      @products = Product.where(lock: false, category_id: params[:category_id]).last(4)
    end
  end
end
