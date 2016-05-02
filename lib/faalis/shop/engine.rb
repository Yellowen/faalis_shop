module Faalis
  module Blog
    class Engine < ::Rails::Engine
      isolate_namespace Faalis::Blog

      engine_name 'faalis_blog'

      mattr_accessor :index_url_prefix do
        'posts'
      end

      mattr_accessor :default_layout do
        'blog'
      end

    end
  end
end
