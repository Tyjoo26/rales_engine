Rails.application.routes.draw do




  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :invoices do
        get '/find', to: 'search#show'
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
