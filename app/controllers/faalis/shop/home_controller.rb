module Faalis::Shop
  class HomeController < ApplicationController
    before_action :asd
    def index
    end

    private
    def asd
      puts "<<<<<<<<<<<<<<<", view_paths
    end
  end
end
