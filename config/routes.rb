Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    get 'hello_me', to: 'dashboard#hello_me'
    resources :services
    resources :categories

    post 'bulk_delete', to: 'bulk_actions#bulk_delete'
  end
end
