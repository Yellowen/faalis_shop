Faalis::Shop::Engine.routes.draw do

  get "#{Faalis::Shop::Engine.products_url_prefix}", to: 'products#index', as: :products

  get "#{Faalis::Shop::Engine.categories_url_prefix}", to: 'categories#index', as: :categories

  in_dashboard do
    scope :shop do
      resources :categories
      resources :products
      resources :orders
      resources :order_items
    end
  end

  root 'home#index'
end
