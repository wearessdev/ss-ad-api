# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, format: :json do
      resources :users
      resources :auth

      resources :authors
      resources :categories
      resources :teams

      resources :articles, shallow: true do
        resources :images
        patch 'like' => 'articles#like'
        patch 'love' => 'articles#love'
        patch 'dislike' => 'articles#dislike'
        patch 'dislove' => 'articles#dislove'
      end

      resources :events, shallow: true do
        resources :images
        patch 'like' => 'events#like'
        patch 'love' => 'events#love'
        patch 'dislike' => 'events#dislike'
        patch 'dislove' => 'events#dislove'
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
