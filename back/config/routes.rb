Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get "up" => "rails/health#show", as: :rails_health_check

      namespace :current do
        resource :user, only: [:show]
      end

      resources :users, only: [] do
        resources :training_items, only: [:index, :create, :update, :destroy], module: :users
      end
    end
  end
end
