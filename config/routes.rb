Faalis::Shop::Engine.routes.draw do

  get "#{Faalis::Shop::Engine.index_url_prefix}", to: 'posts#index', as: :index

  in_dashboard do
    resources :categories
    resources :categories
    resources :posts
  end
end
