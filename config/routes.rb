Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :auth, format: :json

      resources :authors
      resources :categories
      resources :teams

      resources :articles, shallow: true do
        resources :images
      end
      resources :events, shallow: true do
        resources :images
      end

      resources :teams, shallow: true do
        resources :players
        resources :staffs
        resources :games
        resources :seasons
      end
    end
  end
end
