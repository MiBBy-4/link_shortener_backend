Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :links
    end
  end

  namespace :users do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: 'sessions#logout'
    get :logged_in, to: 'sessions#logged_in'
  end

  get '/:link', to: 'redirect#shorted_link'
  # Defines the root path route ("/")
  # root "articles#index"
end
