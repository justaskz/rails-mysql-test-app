Rails.application.routes.draw do
  root 'stats#index'

  resources :workers, only: %i[create destroy]

  mount Sidekiq::Web => '/sidekiq'
end
