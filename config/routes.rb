Rails.application.routes.draw do
  mount Sidekiq::Web => '/'

  resource :records, only: [:new, :edit]
end
