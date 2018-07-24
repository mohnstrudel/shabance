Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :front do
    root "static_pages#home"
    get 'contact', to: 'static_pages#contact'
    resources :categories do
      resources :subcategories do
        resources :services
      end
    end

    resources :cases, only: [:index]
    resources :posts, only: [:index, :show]

    # resources :services

  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    get 'hello_me', to: 'dashboard#hello_me'
    resources :services
    resources :categories
    resources :cases
    resources :articles
    resources :article_categories

    resources :posts do
      resources :images, :only => [:create, :destroy] # support #create and #destroy
    end
    resources :post_categories

    resources :newsletter_requests
    resources :contact_requests

    resources :settings

    post 'bulk_delete', to: 'bulk_actions#bulk_delete'
  end
end
