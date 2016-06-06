Faalis::Routes.draw(::Faalis::Shop::Engine) do
  faalis do
    in_dashboard do |app|
      namespace :shop do
        resources :categories
        resources :products
        resources :orders
        resources :order_items
      end
    end
  end

  plugin do
    #get "#{Faalis::Shop::Engine.products_url_prefix}", to: 'products#index', as: :products
    #get "#{Faalis::Shop::Engine.categories_url_prefix}", to: 'categories#index', as: :categories
    get '', to: 'products#index'
    get 'orders', to: 'orders#index'
  end
end
