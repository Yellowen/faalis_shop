Faalis::Shop::Engine.routes.draw do

  get "#{Faalis::Shop::Engine.products_url_prefix}", to: 'products#index', as: :products

  get "#{Faalis::Shop::Engine.categories_url_prefix}", to: 'categories#index', as: :categories

  in_dashboard do
    resources :order_items
    resources :order_items
    resources :order_items
    scope :shop do
      resources :categories
      resources :products
      resources :orders
    end
  end
end
