Faalis::Routes.draw(::Faalis::Shop::Engine) do
#::Faalis::Shop::Engine.routes.draw do
  faalis do
    in_dashboard do |app|
      namespace :shop do
        resources :categories
        resources :products
        resources :product_images
        resources :orders
        resources :order_items
      end
    end
  end

  plugin do
    get '', to: 'products#index'
    get 'products/:permalink', to: 'products#show' ,as: 'product'

    get 'categories/:permalink', to: 'products#index', as: 'category'
    get 'basket', to: 'orders#basket'
    get 'orders/:id/new', to: 'orders#new', as: 'new_order'
    get 'orders', to: 'orders#index'
    delete 'orders/:id', to: 'orders#destroy', as: 'destroy_order'
  end
end
