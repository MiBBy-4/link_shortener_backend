Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :links
    end
  end

  get '/:link', to: 'redirect#shorted_link'
  # Defines the root path route ("/")
  # root "articles#index"
end
