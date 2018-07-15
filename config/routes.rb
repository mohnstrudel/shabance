Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :front do
    root "static_pages#home"
    resources :categories do
      resources :subcategories
    end
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    get 'hello_me', to: 'dashboard#hello_me'
    resources :services
    resources :categories
    resources :cases
    resources :articles
    resources :article_categories

    resources :posts
    resources :post_categories

    resources :newsletter_requests
    resources :contact_requests

    resources :settings

    post 'bulk_delete', to: 'bulk_actions#bulk_delete'
  end
end
