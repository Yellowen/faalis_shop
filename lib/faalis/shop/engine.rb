module Faalis
  module Shop
    class Engine < ::Rails::Engine
      isolate_namespace Faalis::Shop

      engine_name 'faalis_shop'

      mattr_accessor :index_url_prefix do
        'posts'
      end

      mattr_accessor :default_layout do
        'shop'
      end

    end
  end
end
