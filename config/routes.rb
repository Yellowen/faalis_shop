Faalis::Routes.draw(::Faalis::Shop::Engine) do
#::Faalis::Shop::Engine.routes.draw do

    in_dashboard do |app|
      namespace :shop do
        resources :categories
        resources :products
        resources :orders
        resources :order_items
      end
    end


  plugin do
    get '', to: 'products#index'
    get 'basket', to: 'orders#basket'
  end
end
