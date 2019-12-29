Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'records#index'

  resources :records, only: [:index]
  resource :record, only: [:new, :edit]
end
