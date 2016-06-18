Faalis::Routes.draw(::Faalis::Shop::Engine) do
#::Faalis::Shop::Engine.routes.draw do
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
    get '', to: 'products#index'
    get 'products/:permalink', to: 'products#show' ,as: 'product'
    get 'categories/:permalink', to: 'products#index', as: 'category'
    #get 'basket', to: 'orders#basket'
    resources 'orders'
    #get 'orders', to: 'orders#index'
    #destroy '', to: 'oders#destroy'
  end
end
