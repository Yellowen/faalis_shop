require_dependency "faalis/application_controller"

module Faalis::Shop
  class ProductsController < ::ApplicationController

    def index
      @products = Product.find_by(user: current_user)
    end

  end
end
